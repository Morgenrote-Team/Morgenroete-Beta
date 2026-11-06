#!/usr/bin/env python3
"""Upload this repository's English localization to ParaTranz as source text.

  push  - upload localization/english/**.yml (create or update);
          keys removed from a file are removed on ParaTranz as well
  list  - print the files ParaTranz has under the prefix (read-only)

Environment:
  PARATRANZ_TOKEN    API token (profile page -> settings)
  PARATRANZ_PROJECT  project id
  PARATRANZ_PREFIX   folder on ParaTranz that mirrors localization/english/, e.g. "Morgenr\u00f6te Beta"
"""

import argparse
import os
import sys
import time
from pathlib import Path

import requests

API = "https://paratranz.cn/api"
SRC_DIR = Path("localization/english")
SRC_TAG = "_l_english"

# ParaTranz allows 480 requests per minute per user
MIN_INTERVAL = 0.15


class ParaTranz:
    def __init__(self, token, project):
        self.project = project
        self.session = requests.Session()
        self.session.headers["Authorization"] = f"Bearer {token}"
        self.last_call = 0.0

    def request(self, method, path, **kwargs):
        url = f"{API}/projects/{self.project}{path}"
        for attempt in range(6):
            wait = self.last_call + MIN_INTERVAL - time.monotonic()
            if wait > 0:
                time.sleep(wait)
            self.last_call = time.monotonic()
            resp = self.session.request(method, url, timeout=120, **kwargs)
            # 423: file locked by another update, 429: rate limited, 5xx: server trouble
            if resp.status_code in (423, 429, 500, 502, 503, 504):
                delay = 2 ** attempt * 5
                print(f"  {method} {path} -> {resp.status_code}, retry in {delay}s", file=sys.stderr)
                time.sleep(delay)
                continue
            if not resp.ok:
                raise RuntimeError(f"{method} {path} -> {resp.status_code}: {resp.text[:500]}")
            return resp.json() if resp.content else None
        raise RuntimeError(f"{method} {path} failed after retries")

    def files(self):
        return self.request("GET", "/files")

    def create_file(self, local_path, remote_dir):
        with open(local_path, "rb") as f:
            return self.request("POST", "/files", data={"path": remote_dir},
                                files={"file": (local_path.name, f)})

    def update_file(self, file_id, local_path):
        with open(local_path, "rb") as f:
            # incremental=false: keys missing from the new file are deleted
            return self.request("POST", f"/files/{file_id}", data={"incremental": "false"},
                                files={"file": (local_path.name, f)})

    def delete_file(self, file_id):
        return self.request("DELETE", f"/files/{file_id}")


def remote_name(prefix, rel):
    return f"{prefix}/{rel.as_posix()}" if prefix else rel.as_posix()


def remote_files_under(pt, prefix):
    head = f"{prefix}/" if prefix else ""
    return {f["name"][len(head):]: f for f in pt.files() if f["name"].startswith(head)}


def cmd_list(pt, prefix, args):
    for rel, f in sorted(remote_files_under(pt, prefix).items()):
        print(f"{f['id']:>8}  {f['translated']:>6}/{f['total']:<6}  {rel}")


def cmd_push(pt, prefix, args):
    # rglob("*.yml"), not "*_l_english.yml": some file names are irregular, e.g. "..._l_english .yml"
    local = sorted(p.relative_to(SRC_DIR) for p in SRC_DIR.rglob("*.yml") if SRC_TAG in p.name)
    remote = remote_files_under(pt, prefix)
    created = updated = unchanged = 0

    for rel in local:
        path = SRC_DIR / rel
        f = remote.get(rel.as_posix())
        if f is None:
            remote_dir = prefix if rel.parent == Path(".") else remote_name(prefix, rel.parent)
            print(f"create  {rel}")
            if not args.dry_run:
                pt.create_file(path, f"{remote_dir}/" if remote_dir else "")
            created += 1
            continue
        if args.dry_run:
            print(f"check   {rel}")
            continue
        result = pt.update_file(f["id"], path)
        if result.get("status") == "hashMatched":
            unchanged += 1
            continue
        rev = result.get("revision") or {}
        print(f"update  {rel}  +{rev.get('insert', 0)} ~{rev.get('update', 0)} -{rev.get('remove', 0)}")
        updated += 1

    local_set = {rel.as_posix() for rel in local}
    orphans = sorted(set(remote) - local_set)
    for rel in orphans:
        if args.delete_files:
            print(f"delete  {rel}")
            if not args.dry_run:
                pt.delete_file(remote[rel]["id"])
        else:
            print(f"orphan  {rel}  (not in repo; pass --delete-files to remove)")

    print(f"\ncreated {created}, updated {updated}, unchanged {unchanged}, orphans {len(orphans)}")


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("command", choices=["push", "list"])
    parser.add_argument("--prefix", default=os.environ.get("PARATRANZ_PREFIX", ""),
                        help="ParaTranz folder mirroring localization/english/")
    parser.add_argument("--project", default=os.environ.get("PARATRANZ_PROJECT"))
    parser.add_argument("--dry-run", action="store_true", help="show what would change, write nothing")
    parser.add_argument("--delete-files", action="store_true",
                        help="push: delete ParaTranz files that no longer exist in the repo")
    args = parser.parse_args()

    token = os.environ.get("PARATRANZ_TOKEN")
    if not token or not args.project:
        parser.error("PARATRANZ_TOKEN and PARATRANZ_PROJECT (or --project) are required")
    if not SRC_DIR.is_dir():
        parser.error(f"run from the repository root ({SRC_DIR} not found)")

    pt = ParaTranz(token, args.project)
    prefix = args.prefix.strip("/")
    {"push": cmd_push, "list": cmd_list}[args.command](pt, prefix, args)


if __name__ == "__main__":
    main()

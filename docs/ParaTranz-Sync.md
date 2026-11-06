# ParaTranz Source Sync / ParaTranz 原文同步

[English](#english) · [中文](#中文)

---

## English

### What it does

Whenever `localization/english/` changes on a configured branch whose automatic push is switched on, a GitHub Actions workflow uploads the English files to the Morgenröte translation projects on [ParaTranz](https://paratranz.cn) as **source text**. Translators then see the new and changed strings on the platform.

It only goes one way: GitHub → ParaTranz, English source only. Translations are **not** written back to the repository; export them from ParaTranz as before.

### Files

| File | Purpose |
| --- | --- |
| `.github/workflows/paratranz-push.yml` | The workflow: when to run, and one job per target project |
| `.github/paratranz-targets.json` | Configuration: which branch pushes to which projects and folders |
| `tools/paratranz_sync.py` | The script that talks to the ParaTranz API |
| `docs/ParaTranz-Sync.md` | This manual |

### Setup (once)

1. Copy the four files into the repository at the paths above.
2. In the repository, open **Settings → Secrets and variables → Actions → New repository secret**:
   - Name: `PARATRANZ_TOKEN`
   - Value: an API token from ParaTranz (**profile → Settings**).
   - The token's account **must be an admin of every target project**, because creating, updating and deleting files needs admin rights. LordR19, who created all Morgenröte projects, has that role.
3. Commit and push. Automatic push starts **off** for every channel; manual runs work right away. See [Automatic push switch](#automatic-push-switch) to turn it on.

### How it runs

**Triggers**

- Automatic: a push to any branch that changes something under `localization/english/`. A channel is pushed only if its [switch](#automatic-push-switch) is on.
- Manual: **Actions → ParaTranz - Push Source → Run workflow**. Pick the branch; optionally tick `delete-files` (see below). Manual runs ignore the switches.

**Steps**

1. **`targets` job**: reads `.github/paratranz-targets.json` and collects the projects configured for the current branch. For automatic runs it drops channels whose switch is off. If nothing is left, the run ends here with a notice and nothing is sent.
2. **`push (<name>)` jobs**: one job per target project, shown in the Actions page as e.g. `push (zh-cn)`.
   - One failing project does not stop the others.
   - Jobs run one after another, because all of them share one token and therefore one rate limit.

**What happens to each project**

The script lists the files on ParaTranz, then matches them with the local files by path:

`localization/english/<path>` ↔ `<prefix>/<path>` on ParaTranz

| Situation | Action | Log line |
| --- | --- | --- |
| File is not on ParaTranz yet | Upload it as a new file | `create  <path>` |
| File exists and its content changed | Upload it over the existing file | `update  <path>  +added ~changed -removed` |
| File exists and is unchanged | ParaTranz compares the file hash and skips it | (nothing) |
| File is on ParaTranz but no longer in the repo | Leave it alone | `orphan  <path>` |

When a file is updated:

- Keys that were removed from the file are **deleted on ParaTranz**, together with their translations.
- Renamed keys count as deleted plus added, so they need to be translated again.
- According to the ParaTranz API documentation, this upload changes only the source text, not the existing translations.

At the end each job prints a summary such as `created 0, updated 3, unchanged 143, orphans 2`.

### Configuration: `.github/paratranz-targets.json`

```json
{
  "channels": {
    "main": {
      "branch": "Main",
      "targets": [
        { "name": "zh-cn", "project": 15113, "prefix": "Morgenröte" }
      ]
    },
    "beta": {
      "branch": "1.15",
      "targets": [
        { "name": "zh-cn", "project": 15113, "prefix": "Morgenröte Beta" }
      ]
    }
  },
  "unassigned": [
    { "name": "de", "project": 15094, "prefix": "" }
  ]
}
```

| Field | Meaning |
| --- | --- |
| `channels` | Named groups, e.g. `main` and `beta`. Each one has a source branch and a list of targets. |
| `branch` | The branch that feeds this channel. |
| `targets[].name` | A label, used only in the job name. |
| `targets[].project` | The ParaTranz project id (the number in `paratranz.cn/projects/<id>`). |
| `targets[].prefix` | The folder on ParaTranz that mirrors `localization/english/`. `""` means the project root. |
| `unassigned` | Known projects that are **not** pushed yet. Move an entry into a channel's `targets` to enable it. |

**Current projects**

| Project | Language | Folder on ParaTranz | Channel |
| --- | --- | --- | --- |
| 15113 | 简体中文 | `Morgenröte` | main (`Main`) |
| 15113 | 简体中文 | `Morgenröte Beta` | beta (`1.15`) |
| 15094 | Deutsch | root | unassigned |
| 15095 | Português Brasileiro | root | unassigned |
| 15098 | Français | root | unassigned |
| 15114 | Español | root | unassigned |
| 15115 | 日本語 | root | unassigned |
| 15116 | 한국어 | root | unassigned |
| 15118 | Polski | root | unassigned |
| 15120 | Русский | root | unassigned |
| 15153 | Türkçe | root | unassigned |

> As of 2026-11-01, the files in the root of the nine unassigned projects match the `1.15` branch. `Main` lacks ten of these files, including `santos_*`, `curtiss/` and `glossary/`. If those projects are fed from `Main`, every key that exists only in `1.15` is deleted on ParaTranz together with its translation.

### Automatic push switch

Each channel has its own switch: a repository variable named `PARATRANZ_AUTO_<CHANNEL>`, where `<CHANNEL>` is the channel name in upper case.

| Channel | Variable |
| --- | --- |
| `main` | `PARATRANZ_AUTO_MAIN` |
| `beta` | `PARATRANZ_AUTO_BETA` |

- **On**: the value is `true` (case does not matter).
- **Off**: the variable is missing, or has any other value such as `false`. A missing variable means off, so automatic push starts off.
- Manual runs always push, whatever the switch says.

To change a switch, open **Settings → Secrets and variables → Actions → Variables** and create or edit the variable. It takes effect on the next push; no commit is needed. Only people with admin access to the repository can see or change these variables.

When a switch is off, an automatic run ends after the `targets` job with the notice `Channel <name>: automatic push is off`.

The switch belongs to the channel, not to the branch. When beta moves from `1.15` to `1.16`, `PARATRANZ_AUTO_BETA` keeps working without any change.

### Common tasks

**Move beta to a new version branch (e.g. 1.15 → 1.16)**

1. Run a dry run with the new branch for each target of the channel (see [Local use](#local-use)).
2. Change `"branch": "1.15"` to `"branch": "1.16"` under `beta`. You do not need to edit the workflow.
3. The next change to `localization/english/` on `1.16` pushes to the beta targets, and `1.15` stops pushing.

**Enable a language project**

Move its entry from `unassigned` into the `targets` of the right channel. Before doing that, dry-run it against that branch.

**Add a new project**

Add `{ "name": "...", "project": <id>, "prefix": "" }` to a channel's `targets`, or to `unassigned`.

**Remove old files from ParaTranz**

Run the workflow manually with `delete-files` ticked. Every `orphan` file in the branch's targets is then **deleted, including all of its translations**. This cannot be undone, so read the `orphan` lines of a normal run first.

**Push everything again**

Run the workflow manually. Files whose content is unchanged are skipped, so this is safe.

### Local use

Run from the repository root:

```bash
pip install requests
export PARATRANZ_TOKEN=<token>
export PARATRANZ_PROJECT=15113
export PARATRANZ_PREFIX="Morgenröte Beta"   # "" for the project root

python tools/paratranz_sync.py list              # read-only: list the files on ParaTranz
python tools/paratranz_sync.py push --dry-run    # read-only: show creates and orphans
python tools/paratranz_sync.py push              # upload for real
python tools/paratranz_sync.py push --delete-files   # upload and delete orphans
```

`--project` and `--prefix` can be given on the command line instead of the environment variables.

`--dry-run` shows which files would be created and which ones are orphans. It cannot show which keys inside a file would be added or removed, because ParaTranz works that out only after it receives the file.

### Limits and safety

- ParaTranz allows 480 requests per minute per user. The script waits at least 0.15 s between requests.
- On 429 (too many requests), 423 (file locked by another update) or a 5xx error, the script retries up to 6 times, waiting 5, 10, 20 … seconds. Any other error stops that job.
- A run touches only projects listed in a channel whose `branch` matches the current branch.
- Files are never deleted unless `delete-files` is ticked.
- File names on ParaTranz must match the repository paths. A file whose name differs is treated as a new file and uploaded a second time.

### Troubleshooting

| Message | Cause | Fix |
| --- | --- | --- |
| `PARATRANZ_TOKEN and PARATRANZ_PROJECT ... are required` | The secret is missing. | Add the `PARATRANZ_TOKEN` secret. |
| `-> 401` | The token is wrong or expired. | Generate a new token and update the secret. |
| `-> 403` | The token's account is not an admin of that project. | Use an admin's token, or have the account made admin. |
| `-> 404` | The project id is wrong. | Check `project` in the config. |
| `retry in ...s` repeated, then `failed after retries` | Rate limit hit, file locked, or ParaTranz is down. | Run the workflow again later. |
| `Channel X: automatic push is off` | The switch of channel X is off. | Set `PARATRANZ_AUTO_X` to `true`, or run the workflow manually. |
| `Nothing to push for branch X` | Branch X is not in any channel, or all of its channels are switched off. | Expected for other branches; otherwise check the switches. |
| Many unexpected `create` lines | The `prefix` does not match the folder name on ParaTranz. | Fix `prefix`. Check with `list`. |

---

## 中文

### 用途

配置好的分支上 `localization/english/` 一有变动，只要这个分支所在通道的自动推送已打开，GitHub Actions 就把英文文件作为**原文**上传到 [ParaTranz](https://paratranz.cn) 上的各个赤色晨曦翻译项目，译者在平台上就能看到新增和修改的词条。

方向只有一个：GitHub → ParaTranz，而且只推英文原文。译文**不会**写回仓库，各语言文件仍按原来的方式从平台导出。

### 文件

| 文件 | 作用 |
| --- | --- |
| `.github/workflows/paratranz-push.yml` | workflow：规定什么时候运行，每个目标项目一个任务 |
| `.github/paratranz-targets.json` | 配置：哪个分支推送到哪些项目、哪个目录 |
| `tools/paratranz_sync.py` | 调用 ParaTranz API 的脚本 |
| `docs/ParaTranz-Sync.md` | 本说明书 |

### 初次设置

1. 把四个文件按上表路径复制进仓库。
2. 打开仓库的 **Settings → Secrets and variables → Actions → New repository secret**：
   - 名称：`PARATRANZ_TOKEN`
   - 值：ParaTranz 的 API Token（**个人资料 → 设置**）。
   - 这个账号**必须是所有目标项目的管理员**，因为创建、更新、删除文件都需要管理员权限。所有赤色晨曦项目的创建者 LordR19 符合要求。
3. 提交并推送。所有通道的自动推送初始都是**关闭**的，手动运行马上就能用。打开自动推送的方法见[自动推送开关](#自动推送开关)。

### 运行方式

**触发条件**

- 自动：任何分支上有改动 `localization/english/` 下文件的推送。只有[开关](#自动推送开关)已打开的通道才会推送。
- 手动：**Actions → ParaTranz - Push Source → Run workflow**。选择分支，可以勾选 `delete-files`（见下文）。手动运行不受开关影响。

**运行步骤**

1. **`targets` 任务**：读取 `.github/paratranz-targets.json`，找出当前分支要推送的项目。如果是自动运行，还会去掉开关关闭的通道。如果最后没有要推送的项目，就提示一下然后结束，不向平台发送任何东西。
2. **`push (<名称>)` 任务**：每个目标项目一个任务，在 Actions 页面上显示为 `push (zh-cn)` 这样的名字。
   - 一个项目失败不影响其他项目。
   - 各任务依次运行，因为它们共用一个 Token，也就共用一份请求频率限制。

**每个项目会发生什么**

脚本先取平台上的文件列表，再和本地文件按路径配对：

`localization/english/<路径>` ↔ 平台上的 `<prefix>/<路径>`

| 情况 | 动作 | 日志 |
| --- | --- | --- |
| 平台上还没有这个文件 | 作为新文件上传 | `create  <路径>` |
| 文件已存在，内容有变化 | 上传覆盖原有文件 | `update  <路径>  +新增 ~修改 -删除` |
| 文件已存在，内容没变 | 平台比较哈希值后跳过 | （不显示） |
| 平台上有，仓库里已没有 | 不处理 | `orphan  <路径>` |

更新文件时：

- 文件里删掉的键，**平台上的词条也会被删除**，译文一起删掉。
- 改了名的键算作“删除一个 + 新增一个”，需要重新翻译。
- 根据 ParaTranz 的 API 文档，这个上传操作只改原文，不改动已有的译文。

每个任务结束时会打印一行汇总，例如 `created 0, updated 3, unchanged 143, orphans 2`。

### 配置文件 `.github/paratranz-targets.json`

结构见英文部分的示例。

| 字段 | 含义 |
| --- | --- |
| `channels` | 通道，例如 `main` 和 `beta`。每个通道有一个来源分支和一组推送目标。 |
| `branch` | 这个通道从哪个分支推送。 |
| `targets[].name` | 名称，只用在任务名里。 |
| `targets[].project` | ParaTranz 项目 ID，即 `paratranz.cn/projects/<id>` 里的数字。 |
| `targets[].prefix` | 平台上对应 `localization/english/` 的目录。`""` 表示项目根目录。 |
| `unassigned` | 已知但**暂不推送**的项目。把条目移到某个通道的 `targets` 里就会启用。 |

**当前项目**

| 项目 | 语言 | 平台目录 | 通道 |
| --- | --- | --- | --- |
| 15113 | 简体中文 | `Morgenröte` | main（`Main`） |
| 15113 | 简体中文 | `Morgenröte Beta` | beta（`1.15`） |
| 15094 | 德语 | 根目录 | 未分配 |
| 15095 | 巴西葡萄牙语 | 根目录 | 未分配 |
| 15098 | 法语 | 根目录 | 未分配 |
| 15114 | 西班牙语 | 根目录 | 未分配 |
| 15115 | 日语 | 根目录 | 未分配 |
| 15116 | 韩语 | 根目录 | 未分配 |
| 15118 | 波兰语 | 根目录 | 未分配 |
| 15120 | 俄语 | 根目录 | 未分配 |
| 15153 | 土耳其语 | 根目录 | 未分配 |

> 截至 2026-11-01，9 个未分配项目根目录里的文件和 `1.15` 分支吻合。`Main` 缺少其中 10 个文件，包括 `santos_*`、`curtiss/`、`glossary/`。如果改由 `Main` 推送，所有只在 `1.15` 存在的键都会在平台上连同译文一起删除。

### 自动推送开关

每个通道有自己的开关，即一个名为 `PARATRANZ_AUTO_<通道名大写>` 的仓库变量。

| 通道 | 变量 |
| --- | --- |
| `main` | `PARATRANZ_AUTO_MAIN` |
| `beta` | `PARATRANZ_AUTO_BETA` |

- **打开**：值为 `true`，不分大小写。
- **关闭**：没有这个变量，或者值是 `false` 等其他任何值。没有变量就等于关闭，所以自动推送初始是关闭的。
- 手动运行不管开关，总会推送。

修改开关：打开 **Settings → Secrets and variables → Actions → Variables**，新建或编辑变量。下一次推送时生效，不需要提交代码。只有仓库管理员能看到和修改这些变量。

开关关闭时，自动运行在 `targets` 任务后就结束，并提示 `Channel <名称>: automatic push is off`。

开关跟着通道走，不跟分支。beta 从 `1.15` 换到 `1.16` 后，`PARATRANZ_AUTO_BETA` 不用改，照样有效。

### 常见操作

**beta 换到新版本分支（例如 1.15 → 1.16）**

1. 用新分支对这个通道的每个目标跑一次只读演练（见[本地运行](#本地运行)）。
2. 把 `beta` 下的 `"branch": "1.15"` 改成 `"branch": "1.16"`。workflow 不用改。
3. 之后 `1.16` 上的英文改动会推送到 beta 的目标，`1.15` 不再推送。

**启用某个语言项目**

把它的条目从 `unassigned` 移到对应通道的 `targets` 里。移之前，先用那个分支对它跑一次只读演练。

**新增项目**

在某个通道的 `targets` 里加一行 `{ "name": "...", "project": <id>, "prefix": "" }`，或者先加进 `unassigned`。

**删除平台上的旧文件**

手动运行 workflow 并勾选 `delete-files`。当前分支所有目标里的 `orphan` 文件都会被**删除，其中的全部译文也会一起删掉**。这个操作无法撤销，所以请先看一次普通运行日志里的 `orphan` 行。

**全部重新推送一遍**

手动运行 workflow 即可。内容没变的文件会被跳过，所以这样做是安全的。

### 本地运行

在仓库根目录：

```bash
pip install requests
export PARATRANZ_TOKEN=<token>
export PARATRANZ_PROJECT=15113
export PARATRANZ_PREFIX="Morgenröte Beta"   # 根目录项目设为 ""

python tools/paratranz_sync.py list              # 只读：列出平台文件
python tools/paratranz_sync.py push --dry-run    # 只读：显示会新建哪些文件、哪些是旧文件
python tools/paratranz_sync.py push              # 实际上传
python tools/paratranz_sync.py push --delete-files   # 上传并删除旧文件
```

`--project` 和 `--prefix` 也可以直接写在命令行里，代替环境变量。

`--dry-run` 能显示会新建哪些文件、哪些是旧文件，但看不出每个文件里会新增或删除哪些键，因为这要等平台收到文件后才能算出来。

### 限制与安全

- 平台每个用户每分钟最多 480 次请求。脚本每两次请求之间至少间隔 0.15 秒。
- 遇到 429（请求太频繁）、423（文件正被别人更新）或 5xx 错误时，脚本最多重试 6 次，依次等待 5、10、20……秒。其他错误会让这个任务直接停止。
- 一次运行只会处理 `branch` 和当前分支相同的通道里列出的项目。
- 不勾选 `delete-files` 就不会删除任何文件。
- 平台上的文件名必须和仓库路径一致。名字对不上的文件会被当作新文件，再上传一份。

### 常见问题

| 提示 | 原因 | 处理 |
| --- | --- | --- |
| `PARATRANZ_TOKEN and PARATRANZ_PROJECT ... are required` | 没有设置 Secret | 添加 `PARATRANZ_TOKEN` |
| `-> 401` | Token 错误或已过期 | 重新生成 Token 并更新 Secret |
| `-> 403` | Token 的账号不是该项目的管理员 | 换用管理员的 Token，或者把这个账号设为管理员 |
| `-> 404` | 项目 ID 写错了 | 检查配置里的 `project` |
| 反复出现 `retry in ...s`，最后 `failed after retries` | 触发了频率限制、文件被锁定，或平台故障 | 稍后重新运行 |
| `Channel X: automatic push is off` | 通道 X 的开关是关闭的 | 把 `PARATRANZ_AUTO_X` 设为 `true`，或者手动运行 |
| `Nothing to push for branch X` | 分支 X 不在任何通道里，或者它所在的通道开关都关着 | 其他分支出现这个提示是正常的；否则检查开关 |
| 出现大量意料之外的 `create` | `prefix` 和平台上的目录名对不上 | 改正 `prefix`，可以先用 `list` 核对 |

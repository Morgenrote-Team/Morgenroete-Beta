Changelog for 2.3.5 "Kraepelin"

Medicine:
- Free Physician (with surgeon trait) for the first nation which invents Triage.
- Free Physician (with psychiatrist trait) for the first nation which invents Psychiatry.
- Free Physician (with epidemiologist trait) for the first nation which invents Quinine.
- Free Physician (with military physician trait) for the first nation which invents Modern Nursing.

Psychiatry:
- Physicians with Psychiatrist trait can found a Mental Asylum.
- Added Mental Asylum building with PMs based on psychiatry/psychology techs.
- Characters (politicians, rulers, agitators) with psychological afflictions, addictions or dementia (senile) can be commissioned to the Mental Asylum. This may cause a bit uproar, but not as much as exiling them (they ARE mentally ill, after all).
- Rework of Treatment Success chance for treating psychological affliction, opium addiction, alcoholic, shellshocked. Asylum, Asylum PMs and Psychotherapeutic Points play a major role.
- Introduced Psychotherapeutic Points (PPs). PPs can be gained monthly having a psychiatrist, psychiatric/psychological technologies or a mental asylum. They can also be gained via event. Maximum: 1000 PP.
- Added four different Psychological Schools via Journal Entries. A country can only found one school. To get one, you need a psychiatrist, the right technology and PPs.
- With a certain amount of PPs, your chances for a succesfull psychological treatment success rises.

Spanish Flu Rework:
- Spanish Flu is now a harvest condition like every other disease.
- Spanish Flu spreads automatically, no spread events.
- Added Game Rule for Spanish Flu:
- a) Dynamic Flu: Will start between 1905 and 1920 in an industrialized country. Named after origin country.
- b) Historical Flu: Starts in 1918. Gets the name Spanish Flu.
- c) No Flu: There will be no pandemic.
- Spanish Flu will not have waves, but is a constant condition which may stay 60 to 100 weeks.
- Government Response (now: Pandemic Policy) is done via Physician GUI instead decisions.
- Pandemic Policy is active until you change it; however, you only can change it after at least 6 months.
- Pandemic Policy needs Central Planning tech.
- Lockdown costs 10 authority for each state, measures cost 5 authority for each state.
- States with measures/lockdown have the chance to gain the "pandemic fading" modifier after some weeks/months, depending on harsher or milder modifiers.
- States with a "pandemic fading" modifier have a chance to lose the Spanish flu condition earlier.
- Having high health care insitution (>=4), high medical techniques tier (>=6) or a famous physician will give a higher chance for the two events mentioned above.
- If the country has a physician, he can try to fight the pandmeic and lessen the impact, or research the pandemic.
- Possible outcomes of pandemic research: Discovery of the Pathogen (only with biologist!), Disocvery of the origin, Treatment, Description or nothing.
- Anti-Mask League can be discredited only with an experienced/famous Physician and Germ Theory.

Quality of Life:
- Technology tooltips now show you the tooltipable technology.
- In the Medicine window it is now indicated whether you have the technology required for the treatment or not.

Changes:
- Scania has now a (normal) Formation, representing Kristianstad Basin.
- Added Grey's adjustments for oil, electirc and chemical company, adding synthetic oil and synthetic rubber factories.

GUI:
- Added various rankings to the academic rankings. You can change between them by clicking a button in the tooltip window.
- If you use the Community Mod Framework the Alerts will work again.

Fixes
- Physicians should not research different descriptions and treatments at once.
- Fixed locs using diphteria instead of diphtheria.
- Plague should work as intended now.
- Polio should work as intended now.
- If the Morgenröte Button somehow gets removed, it will get added back after a month.
- Various small loc fixes.
- Pathogen and Vaccine Clues should now be visible and not stay at 0 no matter what you do.
- Events with exploding mines will no longer remove all the mines and instead add some negative throughput.
- Edison can no longer spawn as a politician, so you won't have two Edisons anymore.

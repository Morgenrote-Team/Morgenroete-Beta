Changelog for 2.3.1 "Einthoven"

Engineering:
- You can now choose which building you want to improve with a new GUI window.
- The Railway project is no longer part of the Infrastructure project. It is now a seperate project that also adds a throughput modifier to the railway building.
- You can now choose the order in which the states are improved for the railway and topographic map projects with a new GUI window.
- Your enineer will now get experience every time he finishes improving a state with a modifier in the railway and topographic map projects.

Epidemic Diseases:
- Changed Epidemic Diseases completely to the Harvest Condition system. This makes epidemics much more flexible and gives the player a better overview. It's also much more simple to maintain (especially in case of bugfixing).
- Epidemics may stay between 40 to 80 weeks (instead of roughly one year), giving your Physician more time to study them.
- Typhus will happen more frequently in states with high devastation.
- Yellow fever will happen more frequently in tropical areas.
- Cholera starts in 1846 instead of 1853.
- Cholera does not have an effect on SoL.
- Cholera, Typhus and Yellow Fever have an effect on infrastructure.
- Tuberculosis has an effect on building throughput.
- Several epidemics may happen at the same time, if an epicenter of a neigbouring state has a negative impact on your country; as this happens automatically, the event for spreading epidemics to other countries was canceled.
- The medical technologies that are necessary for the treatment of a disease, when researched, reduce the severity of the epidemic by 25 percent (for example pasteurization for tuberculosis).

Medicine:
- Added 10 possible inventions when doing Medical research, like Blood Types, Chemotherapy or the first Transplantation
- 6 of the 10 innovations can be gathered on a Medical Congress
- A Physician can be recruited by GUI action if at least one hospital exists in the country. His special skill (surgeon, epidemiologist, etc.) can be selected directly.
- Vienna and Paris start with Hospitals, London and Berlin with Clinics.

Meteorology:
- The Meteorologist trait now spawns more often.
- The Meteorologist trait and Meteorology Production Methods in the Observatory now reduce the impact of weather related harvest conditions.

Monuments:
- Added Petra to Transjordan at start.

Archaeology:
- Petra does not have a prestige bonus at game start. It must be explored by an Archaoelogist via JE to activate the bonus.

Musikverein
- Added a button to found the Musikverein in the composer GUI.

Changes:
- Lower chance that paleontologists spawn at game start.
- Higher chance that engineers and physicians spawn in minor power countries at game start.
- University Specialization PMs, Physics Institute PMs and Astro Lab PM will consume Prints.
- Volcano Expedition JE pinned by default.
- Mountain Expedition JE pinned by default.

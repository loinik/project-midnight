# Midnight in Salem (MID)

Project Midnight — the web prototype Project X grew from — on the Nancy Drew
Engine package (`BASE=NancyDrewEngine`).

- `Ciftree/` — the scenes, converted from the web build's JS:
  - `s0`, `TitleMenu_SC` — the package front end with MID's logo order and title
    art; `MedleyControls_SC` — MID title theme (`MainTheme_SFX`)
  - `s2600–s2651` house (PHH/PHK/PHL), `s2700–s2702` porch (PHP),
    `s2800–s2818` neighbourhood (NBH), `s2900–s2903` Nancy's bedroom (PHG) — Eddy chains
  - `s2625` (fans) toggles day/night → `UI_Transition_SC` → `s2600`;
    `s2649` light switch (`Flags.Switch_toPHG`); `s2650` bathroom sequence
  - `Project_Text_SC` — package keys + MID inventory names and captions
  - `s2614`, `s2627` — 3D inspection (KokoKringle, spray can) not ported yet
- `Sound/` — the web build's .wav as .his (Ogg Vorbis)
- `Video/` — the web build's .jpg backgrounds and .mp4 clips, still to be
  converted to .bik (`*_BG` stills, `HER_Logo_ANIM`, `ND_LOGO_ANIM`,
  `UI_TransD2N_BG`, `UI_TransN2D_BG`)

Not taken from the web build: `UI_Play_SC` (browser audio-unlock stub), 3D
(`*_MDL.gltf`, `*_Cache.json`, `Build/three`), web fonts, the HTML shell, the
JS UI scripts (the engine's own UI is used) and UI atlases identical to the
package's.

## 2026-10-22: UI, music, credits, clock, tutorial, awards

- UI atlases from the web build (`UI_Cursors/Difficulty/MainMenu*/Phone*_OVL.png`,
  `Cursors_SC.lua`); `UI_PhoneButtons_OVL` has a drawn CLOCK icon at 136,168 / 136,251
- Music: the original soundtrack as `Sound/MID_*_SFX.his`; `MedleyControls_SC` (menu =
  Cold, house = Feelings / night Family Drama + reprises, town = Sleuthing / Town Square,
  Medley_Puzzle = Sleuthing, Medley_Breakfast = Friendly, Medley_Chase), tagged per env
  by `<ENV>_AMB_SC` → `MID_MedleyTag_SC` (switches live on Flags.Night_FL)
- Time: `MID_Time_SC` (VarTable.MID_Day_VT + Flags.Night_FL); advanced ONLY from the
  phone Clock app while in Nancy's bedroom (PHG s2900–s2903, `MID_Bedroom_AREA` from
  `PHG_AMB_SC`) → `UI_Transition_SC` → s2900. The fans (`s2625`) no longer switch.
  `s2649`: the bedroom needs the light on at night; switch (Flags.Switch_toPHG) reloads the node
- Phone: `PhoneMainMenu_SC` + Clock app (`PhoneClock_SC`, built from UI_Phone_OVL digits/fields/arrow); Ned → voicemail (`PNN_Alpha_SC`);
  Bonus Edition (Brain.Bonus_BR from s0) keeps the Games app
- Credits: `Credits_SC` = SEA logic + MID_MainMenu_BG + Main Theme;
  `Credits_Text_SC` = original English credits
- Tutorial: SEA's tutorial (TUT_*, hard links) + `TUT_Start_SC`/`Tutorial_Text_SC`
- Awards (stub): `MID_Achievements_SC` (all 21 Steam + Trivia/Egged/Spoiler Free +
  Bonus), `MetaAwardsData_SC` maps 13 of them onto SEA's slots
- Prepared, not wired: `MID_Tasks_SC` (original TODO list), `MID_Bonus_Text_SC`
  (characters, notes, Bonus Edition blurb)
- 3D close-ups `s2614`, `s2627` unreachable (navs commented out)

-- Midnight in Salem: medleys from the original soundtrack (Ryan Ricks).
-- Rough first pass — the list ORDER is the priority (first tagged area wins),
-- so the scene-specific medleys come before the area ones.
--   Medley_OPN            main menu: Cold
--   Medley_Credits        credits: Main Theme
--   Medley_Puzzle         puzzles (the "I know" letter in the original): Sleuthing
--   Medley_Breakfast      the morning cooking puzzle: Friendly
--   Medley_Chase          ghostly chases: Chase
--   Medley_House(Night)   the whole Parry house zone (PHH/PHK/PHL/PHG/PHP/NBH): Feelings by
--                         day, Family Drama at night
--   Medley_Town(Night)    Town Square (not ported yet): Sleuthing / Town Square,
--                         reprises at night
-- The area medleys are tagged by <ENV>_AMB_SC (MID_MedleyTag_SC).
Scene:Include("Dict_SC")
Scene:Include("List_SC")
defaultFadeDuration = 2
defaultRestDurations = {min = 30, max = 45}
defaultTransition = "Crossfade"
tacitLength = {min = 10, max = 10}
medleyVolumeInput = List({
  {name = "Medley_NoVolume", volume = 0},
  {name = "Medley_LowVolume", volume = 0.33},
  {name = "Medley_MidVolume", volume = 0.66}
})
medleyAreaInput = {
  {name = "Medley_NONE"},
  -- CAR (make_mid_car_scenes.py): the drive, Driving Pt2 looping with no rests
  {name = "Medley_Car", playlist = Dict({Driving_Pt2_Loop_SFX = 100}), restDurations = {min = 0, max = 0}},
  {name = "Medley_Credits", playlist = Dict({MID_MainTheme_SFX = 100}), restDurations = {min = 3, max = 5}},
  -- title menu: the Unity game's menu loop (Mus_MainMenu_Sec4STR_Sec2HARP_AmbCold), seamless, no rests
  {name = "Medley_OPN", playlist = Dict({MID_Cold_SFX = 100}), restDurations = {min = 0, max = 0}},
  {name = "Medley_Chase", playlist = Dict({MID_Chase_SFX = 60, MID_ChaseReprise_SFX = 40}), restDurations = {min = 1, max = 2}},
  {name = "Medley_Puzzle", playlist = Dict({MID_Sleuthing_SFX = 100}), restDurations = {min = 5, max = 10}},
  {name = "Medley_Breakfast", playlist = Dict({MID_Friendly_SFX = 100}), restDurations = {min = 5, max = 10}},
  -- house: Feelings by day, Family Drama at night — nothing else
  {name = "Medley_HouseNight", playlist = Dict({MID_FamilyDrama_SFX = 100}), restDurations = {min = 0, max = 0}},
  {name = "Medley_House", playlist = Dict({MID_Feelings_SFX = 100}), restDurations = {min = 0, max = 0}},
  -- town: Sleuthing / Town Square by day; at night the reprises, more often
  {name = "Medley_TownNight", playlist = Dict({MID_SleuthingReprise_SFX = 50, MID_TownSquareReprise_SFX = 50}), restDurations = {min = 10, max = 20}},
  {name = "Medley_Town", playlist = Dict({MID_Sleuthing_SFX = 50, MID_TownSquare_SFX = 50})}
}
songVolumesInput = Dict({
  MID_MainTheme_SFX = 0.75,
  MID_Cold_SFX = 0.7,
  MID_Feelings_SFX = 0.4,
  MID_HathorneHouse_SFX = 0.4,
  MID_Puzzling_SFX = 0.4,
  MID_PuzzlingReprise_SFX = 0.4,
  MID_FamilyDrama_SFX = 0.4,
  MID_Fear_SFX = 0.35,
  MID_Sleuthing_SFX = 0.4,
  MID_SleuthingReprise_SFX = 0.4,
  MID_TownSquare_SFX = 0.4,
  MID_TownSquareReprise_SFX = 0.4,
  MID_Friendly_SFX = 0.45,
  MID_Chase_SFX = 0.5,
  MID_ChaseReprise_SFX = 0.5
})

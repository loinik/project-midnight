-- Midnight in Salem (Project Midnight): s2629
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2629"}):Sum({"PHL_EasterEgg" .. N .. "_BG"})
  :Nav({"back", RectB(560), "s2626"})

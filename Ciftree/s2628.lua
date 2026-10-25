-- Midnight in Salem (Project Midnight): s2628
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2628"}):Sum({"PHL_Bin" .. N .. "_BG"})
  :Nav({"back", RectB(560), "s2626"})

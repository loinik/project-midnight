-- Midnight in Salem (Project Midnight): s2815
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"NBH"}):Scene({"s2815"}):Sum({"NBH_NavC" .. N .. "_BG"})
  :Nav({"forward", RectM(0, 70, 1024, 640), "s2817"})
  :Nav({"uTurn", RectB(560), "s2816"})

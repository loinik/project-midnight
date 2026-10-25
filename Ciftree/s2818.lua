-- Midnight in Salem (Project Midnight): s2818
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"NBH"}):Scene({"s2818"}):Sum({"NBH_NavDBack" .. N .. "_BG"})
  :Nav({"forward", RectM(0, 70, 1024, 640), "s2816"})
  :Nav({"uTurn", RectB(560), "s2817"})

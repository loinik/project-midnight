-- Midnight in Salem (Project Midnight): s2816
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"NBH"}):Scene({"s2816"}):Sum({"NBH_NavCBack" .. N .. "_BG"})
  :Nav({"forward", RectM(0, 70, 1024, 640), "s2801"})
  :Nav({"uTurn", RectB(560), "s2815"})

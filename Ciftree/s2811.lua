-- Midnight in Salem (Project Midnight): s2811
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"NBH"}):Scene({"s2811"}):Sum({"NBH_NavA" .. N .. "_BG"})
  :Nav({"forward", RectM(0, 70, 1024, 640), "s2813"})
  :Nav({"uTurn", RectB(560), "s2812"})

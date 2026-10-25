-- Midnight in Salem (Project Midnight): s2647
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2647"}):Sum({"PHH_NavABack" .. N .. "_BG"})
  :Nav({"leftCorner", RectM(200, 70, 824, 640), "s2645"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2648"})
  :Nav({"uTurn", RectB(560), "s2646"})

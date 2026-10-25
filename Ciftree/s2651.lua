-- Midnight in Salem (Project Midnight): s2651
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2651"}):Sum({"PHH_NavBBack" .. N .. "_BG"})
  :Nav({"leftCorner", RectM(200, 70, 824, 640), "s2647"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2650"})
  :Nav({"uTurn", RectB(560), "s2649"})

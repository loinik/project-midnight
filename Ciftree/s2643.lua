-- Midnight in Salem (Project Midnight): s2643
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2643"}):Sum({"PHH_StrD2" .. N .. "_BG"})
  :Nav({"leftCorner", RectM(200, 70, 824, 640), "s2641"})
  :Nav({"uTurn", RectB(560), "s2642"})

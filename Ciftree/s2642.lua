-- Midnight in Salem (Project Midnight): s2642
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2642"}):Sum({"PHH_StrU2" .. N .. "_BG"})
  :Nav({"rightCorner", RectM(200, 70, 824, 640), "s2644"})
  :Nav({"uTurn", RectB(560), "s2643"})

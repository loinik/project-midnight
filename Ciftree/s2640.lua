-- Midnight in Salem (Project Midnight): s2640
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2640"}):Sum({"PHH_StrU1" .. N .. "_BG"})
  :Nav({"rightCorner", RectM(200, 70, 824, 640), "s2642"})
  :Nav({"uTurn", RectB(560), "s2641"})

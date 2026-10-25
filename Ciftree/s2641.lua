-- Midnight in Salem (Project Midnight): s2641
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2641"}):Sum({"PHH_StrD3" .. N .. "_BG"})
  :Nav({"forwardLeft", RectM(200, 70, 824, 640), "s2602"})
  :Nav({"uTurn", RectB(560), "s2640"})

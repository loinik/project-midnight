-- Midnight in Salem (Project Midnight): s2601
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2601"}):Sum({"PHH_Node" .. N .. "0001_BG"})
  :Nav({"forwardLeft", RectM(200, 70, 824, 640), "s2620"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2602"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2600"})
  :Nav({"uTurn", RectB(560), "s2603"})

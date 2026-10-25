-- Midnight in Salem (Project Midnight): s2622
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2622"}):Sum({"PHL_Node" .. N .. "0002_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2603"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2623"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2621"})
  :Nav({"uTurn", RectB(560), "s2620"})

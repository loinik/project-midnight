-- Midnight in Salem (Project Midnight): s2620
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2620"}):Sum({"PHL_Node" .. N .. "0000_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2621"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2623"})
  :Nav({"uTurn", RectB(560), "s2622"})

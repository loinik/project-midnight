-- Midnight in Salem (Project Midnight): s2623
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2623"}):Sum({"PHL_Node" .. N .. "0003_BG"})
  :Nav({"magGlassHot", RectM(624, 250, 824, 390), "s2625"})
  :Nav({"magGlassHot", RectM(200, 0, 400, 690), "s2626"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2620"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2622"})
  :Nav({"uTurn", RectB(560), "s2621"})

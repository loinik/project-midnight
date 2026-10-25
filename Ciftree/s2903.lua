-- Midnight in Salem (Project Midnight): s2903
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHG"}):Scene({"s2903"}):Sum({"PHG_Node" .. N .. "0003_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2900"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2902"})
  :Nav({"uTurn", RectB(560), "s2901"})

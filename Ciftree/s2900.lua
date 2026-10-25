-- Midnight in Salem (Project Midnight): s2900
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHG"}):Scene({"s2900"}):Sum({"PHG_Node" .. N .. "0000_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2901"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2903"})
  :Nav({"uTurn", RectB(560), "s2902"})

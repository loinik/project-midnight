-- Midnight in Salem (Project Midnight): s2902
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHG"}):Scene({"s2902"}):Sum({"PHG_Node" .. N .. "0002_BG"})
  :Nav({"forward", RectM(239, 18, 790, 640), "s2651"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2903"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2901"})
  :Nav({"uTurn", RectB(560), "s2900"})

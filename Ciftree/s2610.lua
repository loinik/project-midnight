-- Midnight in Salem (Project Midnight): s2610
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHK"}):Scene({"s2610"}):Sum({"PHK_Node" .. N .. "0000_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2611"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2613"})
  :Nav({"uTurn", RectB(560), "s2612"})

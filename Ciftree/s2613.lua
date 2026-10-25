-- Midnight in Salem (Project Midnight): s2613
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHK"}):Scene({"s2613"}):Sum({"PHK_Node" .. N .. "0003_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2610"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2612"})
  :Nav({"uTurn", RectB(560), "s2611"})

-- Midnight in Salem (Project Midnight): s2612
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHK"}):Scene({"s2612"}):Sum({"PHK_Node" .. N .. "0002_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2601"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2613"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2611"})
  :Nav({"uTurn", RectB(560), "s2610"})

-- Midnight in Salem (Project Midnight): s2603
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2603"}):Sum({"PHH_Node" .. N .. "0003_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2610"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2600"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2602"})
  :Nav({"uTurn", RectB(560), "s2601"})

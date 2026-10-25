-- Midnight in Salem (Project Midnight): s2648
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2648"}):Sum({"PHH_NavA" .. N .. ((Flags.Night_FL and Flags.Switch_toPHG) and "Light" or "") .. "_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2649"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2647"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2646"})

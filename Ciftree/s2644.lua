-- Midnight in Salem (Project Midnight): s2644
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2644"}):Sum({"PHH_StrU3" .. N .. "_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2646"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2645"})

-- Midnight in Salem (Project Midnight): s2645
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2645"}):Sum({"PHH_StrD1" .. N .. ((Flags.Night_FL and Flags.Switch_toPHG) and "Light" or "") .. "_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2643"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2644"})

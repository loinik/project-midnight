-- Midnight in Salem (Project Midnight): s2602
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2602"}):Sum({"PHH_Node" .. N .. "0002_BG"})
  :NavSfx({"manipulate", RectM(239, 18, 790, 640), "s2604", {"DoorOpen_Wood01_SFX", "DoorOpen_Wood02_SFX", "DoorOpen_Wood03_SFX"}, volume = 0.75})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2603"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2601"})
  :Nav({"uTurn", RectB(560), "s2600"})

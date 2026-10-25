-- Midnight in Salem (Project Midnight): s2702
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHP"}):Scene({"s2702"}):Sum({"PHP_Door" .. N .. "Open_BG"})
  :NavSfx({"forward", RectM(202, 70, 824, 640), "s2600", {"DoorClose_Wood01_SFX", "DoorClose_Wood02_SFX", "DoorClose_Wood03_SFX"}, volume = 0.75})
  :NavSfx({"back", RectB(560), "s2700", {"DoorClose_Wood01_SFX", "DoorClose_Wood02_SFX", "DoorClose_Wood03_SFX"}, volume = 0.75})

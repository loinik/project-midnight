-- Midnight in Salem (Project Midnight): s2700
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHP"}):Scene({"s2700"}):Sum({"PHP_Door" .. N .. "_BG"})
  :NavSfx({"manipulate", RectM(202, 0, 824, 640), "s2702", {"DoorOpen_Wood01_SFX", "DoorOpen_Wood02_SFX", "DoorOpen_Wood03_SFX"}, volume = 0.75})
  :Nav({"uTurn", RectB(560), "s2701"})

-- Midnight in Salem (Project Midnight): s2604
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2604"}):Sum({"PHH_Node" .. N .. "0002_BG"})
  :NavSfx({"forward", RectM(239, 70, 785, 640), "s2701", {"DoorClose_Wood01_SFX", "DoorClose_Wood02_SFX", "DoorClose_Wood03_SFX"}, volume = 0.75})
  :NavSfx({"back", RectB(560), "s2602", {"DoorClose_Wood01_SFX", "DoorClose_Wood02_SFX", "DoorClose_Wood03_SFX"}, volume = 0.75})
  :Overlay({"PHH_DoorOpen_OVL", source = Flags.Night_FL and Rect:New(553, 0, 1104, 672) or Rect:New(0, 0, 551, 672), onScreen = Rect:New(239, 18, 790, 690), z = 0})

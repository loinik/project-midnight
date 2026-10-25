-- Midnight in Salem (Project Midnight): s2649 — hall by Nancy's bedroom. At
-- night the bedroom (s2900) can only be entered with the light on; the switch
-- position (Flags.Switch_toPHG) is saved. Toggling reloads the node so the lit
-- background and the forward nav follow the switch at once.
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
local lit = Flags.Night_FL and Flags.Switch_toPHG
StartEddy():Env({"PHH"}):Scene({"s2649"}):Sum({"PHH_NavB" .. N .. "_BG"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2650"})
  :Nav({"uTurn", RectB(560), "s2651"})
light = AR:Movie({
  movie = "PHH_NavBNightLight_BG",
  onScreen = Rect:New(0, 0, 1024, 690),
  z = 1,
  pauseOnLastFrame = true,
  active = lit and true or false
})
forwardNAV = AR:Hotspot({
  onScreen = Rect:New(275, 70, 749, 640),
  cursor = "Forward",
  z = 2,
  OnDone = function(this)
    Scene:Change("s2900")
  end,
  active = (not Flags.Night_FL) or lit
})
switchNAV = AR:Hotspot({
  onScreen = Rect:New(200, 410, 275, 530),
  cursor = "Manipulate",
  z = 3,
  OnDone = function(this)
    Flags.Switch_toPHG = not Flags.Switch_toPHG
    Scene:Change("s2649")
  end,
  active = Flags.Night_FL and true or false
})

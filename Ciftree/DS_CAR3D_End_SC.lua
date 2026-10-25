-- Midnight in Salem (3D Deirdre): the car pulls up; Pt3 tag, door open/close, fade to s2600.
Brain.DS_CAR_Arrived_BR = true
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({"DS_CAR3D_End_SC"}):Sum({"CAR_Convertible_BG"})
AreaUntag("Medley_Car")
local fadeOut = MakeVideoFader({
  fade = "out",
  duration = 1.5,
  active = false,
  z = 10,
  OnDone = function()
    Brain.EddyFade_BR = true
    Scene:Change("s2600")
  end
})
AR:Sound({sounds = {"Driving_Pt3_Tag_SFX"}, channel = "Theme"})
local doorOpen = AR:Sound({sounds = {"CAR_DoorOpen_SFX"}, channel = "FX1", group = "Effects", active = false})
local doorClose = AR:Sound({
  sounds = {"CAR_DoorClose_SFX"},
  channel = "FX2",
  group = "Effects",
  active = false,
  OnDone = function()
    fadeOut:Restart()
  end
})
AR:Timer({duration = 1.2, OnDone = function() doorOpen.active = true end})
AR:Timer({duration = 3.0, OnDone = function() doorClose.active = true end})

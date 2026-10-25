-- Midnight in Salem: the car pulls up. The road noise stops (CAR_AMB_SC watches
-- DS_CAR_Arrived_BR) and the Driving tag plays; the picture fades to black, Nancy gets out
-- in the dark (door open, door close), then the Parry house (s2600 fades back in on
-- EddyFade_BR).
Brain.DS_CAR_Arrived_BR = true
Flags.Cellphone_Enable_Talk_FL = true -- the phone's Talk app (Ned) opens once Nancy is in Salem
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({"DS_CAR_End_SC"}):Sum({"CAR_Convertible_BG"})
-- Started the way the convo player starts its clips (a constant-spec Xsheet never played).
idleXS = AR:Xsheet({xsheet = "", active = false})
AR:Override({
  RunOnce = function()
    idleXS.xsheet = "DS_CAR_CFid_Idle_XS"
    idleXS:Restart()
  end
})
AreaUntag("Medley_Car")
Scene:Lock()
local doorClose = AR:Sound({
  sounds = {"CAR_DoorClose_SFX"},
  channel = "FX2",
  group = "Effects",
  active = false,
  OnDone = function()
    Brain.EddyFade_BR = true
    -- out of the car: the drive's conversation is over (calls and texts open up)
    Brain.InConvo_BR = false
    Brain.MID_InCar_BR = false
    Scene:Change("s2600")
  end
})
local doorOpen = AR:Sound({
  sounds = {"CAR_DoorOpen_SFX"},
  channel = "FX1",
  group = "Effects",
  active = false,
  OnDone = function()
    doorClose.active = true
  end
})
local fadeOut = MakeVideoFader({
  fade = "out",
  duration = 1.5,
  active = false,
  z = 10,
  OnDone = function()
    doorOpen.active = true
  end
})
AR:Sound({sounds = {"Driving_Pt3_Tag_SFX"}, channel = "Theme"})
AR:Timer({duration = 1.0, OnDone = function() fadeOut:Restart() end})

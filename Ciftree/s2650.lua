-- Midnight in Salem (Project Midnight): s2650 — bathroom door. Opening it plays
-- the open-door clip, fades out, Nancy comments, the door closes and the scene
-- fades back in.
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2650"}):Sum({"PHH_RoomBath" .. N .. "_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2649"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2651"})
local doorShown = false
bathroomNAV = AR:Hotspot({
  onScreen = Rect:New(202, 0, 824, 640),
  cursor = "Manipulate",
  OnDone = function(this)
    Scene:Lock()
    doorShown = true
    openDoorSFX:PlayInstance()
    outTIMER:Restart()
  end
})
doorOpen = AR:Movie({
  movie = "PHH_RoomBathOpen" .. N .. "_BG",
  source = Viewport.uiSize,
  onScreen = Viewport.uiSize,
  loop = true,
  z = 4,
  active = function(this)
    return doorShown
  end
})
outTIMER = AR:Timer({
  duration = 1,
  OnDone = function(this)
    outFADE:Restart()
  end,
  active = false
})
outFADE = MakeVideoFader({
  fade = "out",
  duration = 2,
  OnDone = function(this)
    NDBathroomVO:Restart()
  end,
  active = false,
  z = 8
})
NDBathroomVO = AR:Sound({
  sounds = {
    "Nancy_Bathroom01_SFX",
    "Nancy_Bathroom02_SFX",
    "Nancy_Bathroom03_SFX",
    "Nancy_Bathroom04_SFX",
    "Nancy_Bathroom05_SFX",
    "Nancy_Bathroom06_SFX",
    "Nancy_Bathroom07_SFX",
    "Nancy_Bathroom08_SFX",
    "Nancy_Bathroom09_SFX",
    "Nancy_Bathroom10_SFX"
  },
  channel = "PlayerVoice",
  volume = 0.85,
  OnDone = function(this)
    -- A finished fade-out keeps drawing its black (the fader stays live while
    -- timer.done); disarm it or the fade-in never shows through.
    outFADE:ResetInactive()
    doorShown = false
    closeDoorSFX:PlayInstance()
    inFADE:Restart()
  end,
  active = false
})
inFADE = MakeVideoFader({
  fade = "in",
  duration = 3,
  OnDone = function(this)
    bathroomNAV:Reset()
    Scene:Unlock()
  end,
  active = false,
  z = 8
})
openDoorSFX = AR:Sound({
  sounds = {
    "DoorOpen_Wood_French01_SFX",
    "DoorOpen_Wood_French02_SFX",
    "DoorOpen_Wood_French03_SFX",
    "DoorOpen_Wood_French04_SFX",
    "DoorOpen_Wood_French05_SFX",
    "DoorOpen_Wood_French06_SFX"
  },
  channel = "FX1",
  volume = 0.85,
  active = false
})
closeDoorSFX = AR:Sound({
  sounds = {
    "DoorClose_Wood_French01_SFX",
    "DoorClose_Wood_French02_SFX",
    "DoorClose_Wood_French03_SFX",
    "DoorClose_Wood_French04_SFX",
    "DoorClose_Wood_French05_SFX",
    "DoorClose_Wood_French06_SFX"
  },
  channel = "FX1",
  volume = 0.85,
  active = false
})

-- Midnight in Salem (Project Midnight): s2646 — Mei's room (closed)
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2646"}):Sum({"PHH_RoomMei" .. N .. "_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2648"})
  :Nav({"uTurn", RectB(560), "s2647"})
-- Mei's door: Nancy won't go in uninvited (the game's PHN Door3Locked line).
-- While she speaks the scene is locked (no leaving mid-line) and a second click doesn't
-- restart the line.
local speaking = false
lockedVO = AR:Sound({sounds = {"PHN_MeiDoor_SFX"}, channel = "PlayerVoice", volume = 0.85, active = false,
  OnDone = function(this)
    speaking = false
    Scene:Unlock()
  end
})
meiDoorHS = AR:Hotspot({
  onScreen = Rect:New(200, 0, 824, 640),
  cursor = "Manipulate",
  OnDone = function(this)
    this:Reset()
    if speaking then return end
    speaking = true
    Scene:Lock()
    lockedVO:Restart()
    Brain.MID_MeiDoorTried_BR = true
  end
})

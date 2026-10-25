-- Midnight in Salem: phone Clock app on its own sheet (UI_PhoneClock_OVL, Keep Calm): the
-- current time, and the alarm — the phone's arrows to pick it and SET ALARM to set it.
-- Time lives in MID_Time_SC.
summary = AR:Summary({bg = "", env = ""})
Scene:Include("PhoneGlobals_Vert_SC")
Scene:Include("MID_Time_SC")
MakePhoneFrame()
MakeMainPhotoButton({
  OnDone = function()
    Scene:Change("PhonePhotoTake_SC")
  end
})
MakeMainHomeButton({
  OnDone = function()
    Scene:Change("PhoneMainMenu_SC")
  end
})
MakeMainBackButton({
  OnDone = function()
    Scene:Change("PhoneMainMenu_SC")
  end
})
MakeBackout({
  OnDone = function()
    Scene:EndStream(Scene.streamName)
    summary:Send("CellButton", "AnimateDown")
  end
})
-- like Contacts: the wallpaper under the phone's translucent app panel
MakeWallpaper()
MakeAppBackground()
MakeStatusBar()
MakeCharms()

-- The app's own art: UI_PhoneClock_OVL in Keep Calm (make_phone_clock_ovl.py writes the
-- sheet and PhoneClockArt_SC with its source rects).
Scene:Include("PhoneClockArt_SC")
local CLOCK_OVL = "UI_PhoneClock_OVL"
-- the app title in the status bar, like MakeStatusBar("contacts") draws CONTACTS
titleOVL = AR:Overlay({ovl = CLOCK_OVL, source = PhoneClockArt.title, onScreen = TitleDest, z = 1})

-- Draws `str` ("big" or "small" digits and ":") centred on centerX, top at `top`.
local function DrawDigits(str, size, centerX, top, z)
  local made = {}
  local w = 0
  for i = 1, #str do
    w = w + PhoneClockArt[size .. str:sub(i, i)].width
  end
  local x = math.floor(centerX - w / 2)
  for i = 1, #str do
    local src = PhoneClockArt[size .. str:sub(i, i)]
    made[#made + 1] = AR:Overlay({
      ovl = CLOCK_OVL,
      source = src,
      onScreen = Rect:LTWH(x, top, src.width, src.height),
      z = z
    })
    x = x + src.width
  end
  return made
end

-- A piece of the sheet (AM, PM, ALARM) centred on centerX.
local function Piece(key, centerX, top, z)
  local src = PhoneClockArt[key]
  return AR:Overlay({
    ovl = CLOCK_OVL,
    source = src,
    onScreen = Rect:LTWH(math.floor(centerX - src.width / 2), top, src.width, src.height),
    z = z
  })
end

local h24 = PhoneManager:ClockIs24()
local function TimeStr(time)
  local h = h24 and string.format("%02d", time.hours) or tostring((time.hours - 1) % 12 + 1)
  return h .. ":" .. string.format("%02d", time.minutes)
end
local function AmPm(time)
  return h24 and "" or (time.hours >= 12 and "PM" or "AM")
end
local CX = 511

-- current time
local now = MIDTime:Now()
DrawDigits(TimeStr(now), "big", CX, 96, 0)
if not h24 then
  Piece(AmPm(now), CX, 164, 0)
end

-- alarm: pick a time with the phone's arrows, set it with SET ALARM (the CALL button's
-- style). Nancy can only set it in her bedroom (as in Shadow at the Water's Edge);
-- elsewhere she says "Can't use that right now" (VO + caption in the UI frame).
local choices = MIDTime:AlarmChoices()
local pick = Flags.Night_FL and 1 or 2
Piece("ALARM", CX, 226, 0)
local alarmDigits = {}
local alarmAmPm = nil
local function ShowAlarm()
  for _, o in ipairs(alarmDigits) do
    o.active = false
  end
  alarmDigits = DrawDigits(TimeStr(choices[pick]), "small", CX, 266, 0)
  if alarmAmPm then
    alarmAmPm.active = false
  end
  if not h24 then
    alarmAmPm = Piece(AmPm(choices[pick]), CX, 308, 0)
  end
end
local function Arrow(x, srcUp, srcDown, step)
  return AR:Button({
    hs = AR:Hotspot({onScreen = Rect:New(x, 262, x + 49, 309), cursor = "Point"}),
    upOvl = AR:Overlay({ovl = "UI_Phone_OVL", source = srcUp, onScreen = Rect:LTWH(x + 4, 265, 41, 40)}),
    downOvl = AR:Overlay({ovl = "UI_Phone_OVL", source = srcDown, onScreen = Rect:LTWH(x + 4, 265, 41, 40)}),
    OnUp = function(this)
      sharedPhoneSounds.menu:Restart()
      pick = (pick - 1 + step) % #choices + 1
      ShowAlarm()
    end,
    z = 1
  })
end
-- the arrows on UI_Phone_OVL: 41x40, white (up) and green (down)
prevBTN = Arrow(372, Rect:New(886, 367, 927, 407), Rect:New(933, 367, 974, 407), -1)
nextBTN = Arrow(601, Rect:New(886, 413, 927, 453), Rect:New(933, 413, 974, 453), 1)
ShowAlarm()

local canSleep = MIDTime:InBedroom()
local setRect = Rect:LTWH(CX - 78, 389, 156, 52)
setBTN = AR:Button({
  hs = AR:Hotspot({onScreen = setRect, cursor = "Point"}),
  upOvl = AR:Overlay({ovl = CLOCK_OVL, source = PhoneClockArt.setUp, onScreen = setRect}),
  downOvl = AR:Overlay({ovl = CLOCK_OVL, source = PhoneClockArt.setDown, onScreen = setRect}),
  OnUp = function(this)
    if canSleep then
      sharedPhoneSounds.appButton:Restart()
      MIDTime:Sleep(choices[pick], "s2900")
      Scene:EndStream(Scene.streamName)
      summary:Send("CellButton", "AnimateDown")
    else
      sharedPhoneSounds.CantUseThisVO:Restart()
    end
  end,
  z = 1
})

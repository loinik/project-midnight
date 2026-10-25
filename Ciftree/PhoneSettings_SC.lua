-- MID copy of the package PhoneSettings_SC (decompiled) + the Message Tone picker.
summary = AR:Summary({bg = "", env = ""})
Scene:Include("DropDown_SC")
Scene:Include("PhoneGlobals_Vert_SC")
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
MakeWallpaper()
MakeStatusBar("settings")
MakeCharms()
wallpaperChoicesBackground = AR:Overlay({
  ovl = "UI_Phone_OVL",
  source = Rect:New(354, 2, 704, 142),
  onScreen = Rect:New(354, 2, 704, 142):LeftTopSet(336, 2),
  z = -0.4
})
wallpaperPlaces = {
  Point:New(352, 45),
  Point:New(419, 45),
  Point:New(486, 45),
  Point:New(553, 45),
  Point:New(620, 45)
}
wallpaperRadioOptions = {}
for key, wallpaperData in ipairs(wallpaperOptions) do
  if wallpaperData.tree ~= "LOADSAVE" or PhotoManager:GetCount("wallpaper") > 0 then
    local option = AR:RadioButton({
      groupName = "WallpaperOptions",
      hs = AR:Hotspot({
        onScreen = wallpaperData.thumbSrc:LeftTopSet(wallpaperPlaces[key]),
        cursor = "Point"
      }),
      initiallySelected = wallpaperData.autotextRef == PhoneManager:GetWallpaper(),
      baseOvl = AR:Overlay({
        ovl = "UI_PhoneWP_OVL",
        source = wallpaperData.thumbSrc,
        onScreen = wallpaperData.thumbSrc:LeftTopSet(wallpaperPlaces[key]),
        z = -0.1
      }),
      selectedOvl = AR:Overlay({
        ovl = "UI_Phone_OVL",
        source = Rect:New(884, 487, 936, 578),
        onScreen = wallpaperData.thumbSrc:LeftTopSet(wallpaperPlaces[key]),
        z = -0.05
      }),
      OnSelect = function()
        sharedPhoneSounds.selectSound:Restart()
        PhoneManager:SetWallpaper(wallpaperData.autotextRef)
        Scene:Change(Scene.streamName, Scene.name)
      end
    })
    wallpaperRadioOptions[key] = option
  end
end
ringbackChoicesBackground = AR:Overlay({
  ovl = "UI_Phone_OVL",
  source = Rect:New(354, 147, 704, 220),
  onScreen = Rect:New(354, 147, 704, 220):LeftTopSet(336, 165),
  z = -0.4
})
ringBackCurSelectionBg = AR:Overlay({
  ovl = "UI_Phone_OVL",
  source = Rect:New(884, 457, 1033, 485),
  onScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 200),
  z = -0.1
})
ringBackDropDown = MakeDropDown({
  optionsDefaults = {
    onScreen = Rect:LTWH(110, 68, 149, 28)
  },
  options = {
    {
      text = "PHONE_RingBack01",
      default = PhoneManager:GetRingBack() == "Cell_Ring_Back_01_SFX",
      OnSelected = function()
        PhoneManager:SetRingBack("Cell_Ring_Back_01_SFX")
        sharedPhoneSounds.ringBack.sounds = {
          "Cell_Ring_Back_01_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringBack:Restart()
      end
    },
    {
      text = "PHONE_RingBack02",
      default = PhoneManager:GetRingBack() == "Cell_Ring_Back_02_SFX",
      OnSelected = function()
        PhoneManager:SetRingBack("Cell_Ring_Back_02_SFX")
        sharedPhoneSounds.ringBack.sounds = {
          "Cell_Ring_Back_02_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringBack:Restart()
      end
    },
    {
      text = "PHONE_RingBack03",
      default = PhoneManager:GetRingBack() == "Cell_Ring_Back_03_SFX",
      OnSelected = function()
        PhoneManager:SetRingBack("Cell_Ring_Back_03_SFX")
        sharedPhoneSounds.ringBack.sounds = {
          "Cell_Ring_Back_03_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringBack:Restart()
      end
    },
    {
      text = "PHONE_RingBack04",
      default = PhoneManager:GetRingBack() == "Cell_Ring_Back_04_SFX",
      OnSelected = function()
        PhoneManager:SetRingBack("Cell_Ring_Back_04_SFX")
        sharedPhoneSounds.ringBack.sounds = {
          "Cell_Ring_Back_04_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringBack:Restart()
      end
    },
    {
      text = "PHONE_RingBack05",
      default = PhoneManager:GetRingBack() == "Cell_Ring_Back_05_SFX",
      OnSelected = function()
        PhoneManager:SetRingBack("Cell_Ring_Back_05_SFX")
        sharedPhoneSounds.ringBack.sounds = {
          "Cell_Ring_Back_05_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.95
        sharedPhoneSounds.ringBack:Restart()
      end
    },
    {
      text = "PHONE_RingBack06",
      default = PhoneManager:GetRingBack() == "Cell_Ring_Back_06_SFX",
      OnSelected = function()
        PhoneManager:SetRingBack("Cell_Ring_Back_06_SFX")
        sharedPhoneSounds.ringBack.sounds = {
          "Cell_Ring_Back_06_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringBack:Restart()
      end
    },
    {
      text = "PHONE_RingBack07",
      default = PhoneManager:GetRingBack() == "Cell_Ring_Back_07_SFX",
      OnSelected = function()
        PhoneManager:SetRingBack("Cell_Ring_Back_07_SFX")
        sharedPhoneSounds.ringBack.sounds = {
          "Cell_Ring_Back_07_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringBack:Restart()
      end
    }
  },
  openSound = AR:Sound({
    sounds = "Beep_Double03_SFX",
    channel = "PhoneFX",
    active = false,
    volume = 0.4
  }),
  itemBgs = {
    top = {
      ovl = "UI_Phone_OVL",
      source = Rect:New(884, 457, 1033, 485)
    },
    middle = {
      ovl = "UI_Phone_OVL",
      source = Rect:New(884, 457, 1033, 485)
    },
    bottom = {
      ovl = "UI_Phone_OVL",
      source = Rect:New(884, 457, 1033, 485)
    }
  },
  chosenOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 200),
  openOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 200),
  closeOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 200),
  cursor = "Point"
})
ringtoneChoicesBackground = AR:Overlay({
  ovl = "UI_Phone_OVL",
  source = Rect:New(354, 225, 704, 291),
  onScreen = Rect:New(354, 225, 704, 291):LeftTopSet(336, 250),
  z = -0.4
})
ringToneCurSelectionBg = AR:Overlay({
  ovl = "UI_Phone_OVL",
  source = Rect:New(884, 457, 1033, 485),
  onScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 282),
  z = -0.1
})
ringToneDropDown = MakeDropDown({
  optionsDefaults = {
    onScreen = Rect:LTWH(0, 0, 149, 28),
    fontNum = 11,
    font = {horzAlign = "center", vertAlign = "center"}
  },
  options = {
    {
      text = "PHONE_RingTone01",
      default = PhoneManager:GetRingTone() == "Cell_Ring_Tone_01_SFX",
      OnSelected = function()
        PhoneManager:SetRingTone("Cell_Ring_Tone_01_SFX")
        sharedPhoneSounds.ringTone.sounds = {
          "Cell_Ring_Tone_01_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringTone:Restart()
      end
    },
    {
      text = "PHONE_RingTone02",
      default = PhoneManager:GetRingTone() == "Cell_Ring_Tone_02_SFX",
      OnSelected = function()
        PhoneManager:SetRingTone("Cell_Ring_Tone_02_SFX")
        sharedPhoneSounds.ringTone.sounds = {
          "Cell_Ring_Tone_02_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.8
        sharedPhoneSounds.ringTone:Restart()
      end
    },
    {
      text = "PHONE_RingTone03",
      default = PhoneManager:GetRingTone() == "Cell_Ring_Tone_03_SFX",
      OnSelected = function()
        PhoneManager:SetRingTone("Cell_Ring_Tone_03_SFX")
        sharedPhoneSounds.ringTone.sounds = {
          "Cell_Ring_Tone_03_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.8
        sharedPhoneSounds.ringTone:Restart()
      end
    },
    {
      text = "PHONE_RingTone04",
      default = PhoneManager:GetRingTone() == "Cell_Ring_Tone_04_SFX",
      OnSelected = function()
        PhoneManager:SetRingTone("Cell_Ring_Tone_04_SFX")
        sharedPhoneSounds.ringTone.sounds = {
          "Cell_Ring_Tone_04_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.8
        sharedPhoneSounds.ringTone:Restart()
      end
    },
    {
      text = "PHONE_RingTone05",
      default = PhoneManager:GetRingTone() == "Cell_Ring_Tone_05_SFX",
      OnSelected = function()
        PhoneManager:SetRingTone("Cell_Ring_Tone_05_SFX")
        sharedPhoneSounds.ringTone.sounds = {
          "Cell_Ring_Tone_05_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.8
        sharedPhoneSounds.ringTone:Restart()
      end
    },
    {
      text = "PHONE_RingTone06",
      default = PhoneManager:GetRingTone() == "Cell_Ring_Tone_06_SFX",
      OnSelected = function()
        PhoneManager:SetRingTone("Cell_Ring_Tone_06_SFX")
        sharedPhoneSounds.ringTone.sounds = {
          "Cell_Ring_Tone_06_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.8
        sharedPhoneSounds.ringTone:Restart()
      end
    },
    {
      text = "PHONE_RingTone07",
      default = PhoneManager:GetRingTone() == "Cell_Ring_Tone_07_SFX",
      OnSelected = function()
        PhoneManager:SetRingTone("Cell_Ring_Tone_07_SFX")
        sharedPhoneSounds.ringTone.sounds = {
          "Cell_Ring_Tone_07_SFX"
        }
        sharedPhoneSounds.ringBack.volume = 0.75
        sharedPhoneSounds.ringTone:Restart()
      end
    }
  },
  openSound = AR:Sound({
    sounds = "Beep_Double03_SFX",
    channel = "PhoneFX",
    active = false,
    volume = 0.4
  }),
  itemBgs = {
    top = {
      ovl = "UI_Phone_OVL",
      source = Rect:New(884, 457, 1033, 485)
    },
    middle = {
      ovl = "UI_Phone_OVL",
      source = Rect:New(884, 457, 1033, 485)
    },
    bottom = {
      ovl = "UI_Phone_OVL",
      source = Rect:New(884, 457, 1033, 485)
    }
  },
  chosenOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 282),
  openOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 282),
  closeOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 282),
  cursor = "Point"
})
-- MID: Message Tone, a third picker under Ring Tone (DED's text tones). TextManager plays
-- PhoneManager:GetMessageSound() for every incoming text.
msgToneChoicesBackground = AR:Overlay({
  ovl = "UI_PhoneMsgTone_OVL",
  source = Rect:New(0, 0, 350, 66),
  onScreen = Rect:LTWH(336, 335, 350, 66),
  z = -0.4
})
msgToneCurSelectionBg = AR:Overlay({
  ovl = "UI_Phone_OVL",
  source = Rect:New(884, 457, 1033, 485),
  onScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 367),
  z = -0.1
})
local msgTonePreview = AR:Sound({sounds = PhoneManager:GetMessageSound(), channel = "PhoneFX", active = false})
local msgToneOptions = {}
for i, tone in ipairs({"Alert", "Bell", "Harp", "Horse", "Squeak", "Thunder"}) do
  local sound = "Text_" .. tone .. "_SFX"
  table.insert(msgToneOptions, {
    text = string.format("PHONE_MsgTone%02i", i),
    default = PhoneManager:GetMessageSound() == sound,
    OnSelected = function()
      PhoneManager:SetMessageSound(sound)
      msgTonePreview.sounds = {sound}
      msgTonePreview:Restart()
    end
  })
end
msgToneDropDown = MakeDropDown({
  optionsDefaults = {
    onScreen = Rect:LTWH(0, 0, 149, 28),
    fontNum = 11,
    font = {horzAlign = "center", vertAlign = "center"}
  },
  options = msgToneOptions,
  openSound = AR:Sound({
    sounds = "Beep_Double03_SFX",
    channel = "PhoneFX",
    active = false,
    volume = 0.4
  }),
  itemBgs = {
    top = {ovl = "UI_Phone_OVL", source = Rect:New(884, 457, 1033, 485)},
    middle = {ovl = "UI_Phone_OVL", source = Rect:New(884, 457, 1033, 485)},
    bottom = {ovl = "UI_Phone_OVL", source = Rect:New(884, 457, 1033, 485)}
  },
  chosenOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 367),
  openOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 367),
  closeOnScreen = Rect:New(884, 457, 1033, 485):LeftTopSet(434, 367),
  cursor = "Point"
})
AR:Override({
  OnDie = function(this)
    sharedPhoneSounds.ringBack:StopIfPlaying()
    sharedPhoneSounds.ringTone:StopIfPlaying()
    sharedPhoneSounds.messageSound:StopIfPlaying()
  end
})

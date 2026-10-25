-- Midnight in Salem: the engine's PhoneMainMenu_SC (decompiled) + the Messages app
-- (PhoneTexts_SC) and the Clock app (MID time system, PhoneClock_SC). MID is the Bonus
-- Edition: the Games app (Project Midnight phone games) is always there.
summary = AR:Summary({bg = "", env = ""})
Scene:Include("PhoneGlobals_Vert_SC")
MakePhoneFrame()
MakeMainPhotoButton({
  OnDone = function()
    Scene:Change("PhonePhotoTake_SC")
  end
})
MakeMainHomeButton({
  OnDone = function()
    Scene:EndStream(Scene.streamName)
    summary:Send("CellButton", "AnimateDown")
  end
})
MakeMainBackButtonDisabled()
MakeBackout({
  OnDone = function()
    Scene:EndStream(Scene.streamName)
    summary:Send("CellButton", "AnimateDown")
  end
})
MakeWallpaper()
MakeStatusBar()
MakeCharms()
toTalkButton = MakeAppButton({
  ovl = "UI_PhoneButtons_OVL",
  scene = "PhoneTalk_SC",
  upSource = Rect:New(2, 2, 67, 83),
  downSource = Rect:New(2, 85, 67, 166),
  active = function(this)
    return Flags.Cellphone_Enable_Talk_FL
  end
})
toPhotoTakeButton = MakeAppButton({
  ovl = "UI_PhoneButtons_OVL",
  scene = "PhonePhotoTake_SC",
  upSource = Rect:New(69, 2, 134, 83),
  downSource = Rect:New(69, 85, 134, 166),
  active = function(this)
    return Flags.Cellphone_Enable_Camera_FL
  end
})
if not Brain.TUT_InTutorial_BR then
  do -- MID is always the Bonus Edition (Brain.Bonus_BR is reset by Game:New/Load)
    toGamesButton = MakeAppButton({
      ovl = "UI_PhoneButtons_OVL",
      scene = "PhoneGames_SC",
      upSource = Rect:New(136, 2, 201, 83),
      downSource = Rect:New(136, 85, 201, 166),
      active = function(this)
        return Flags.Cellphone_Enable_Games_FL
      end
    })
  end
  toSettingsButton = MakeAppButton({
    ovl = "UI_PhoneButtons_OVL",
    scene = "PhoneSettings_SC",
    upSource = Rect:New(203, 2, 268, 83),
    downSource = Rect:New(203, 85, 268, 166),
    active = function(this)
      return Flags.Cellphone_Enable_Options_FL
    end
  })
  toMessagesButton = MakeAppButton({
    ovl = "UI_PhoneButtons_OVL",
    scene = "PhoneTexts_SC",
    upSource = Rect:New(2, 168, 67, 249),
    downSource = Rect:New(2, 251, 67, 332),
    active = function(this)
      return Flags.Cellphone_Enable_Messages_FL
    end
  })
  toDiaryButton = MakeAppButton({
    ovl = "UI_PhoneButtons_OVL",
    scene = "PhoneDiary_SC",
    upSource = Rect:New(69, 168, 134, 249),
    downSource = Rect:New(69, 251, 134, 332)
  })
  toClockButton = MakeAppButton({
    ovl = "UI_PhoneButtons_OVL",
    scene = "PhoneClock_SC",
    upSource = Rect:New(136, 168, 201, 249),
    downSource = Rect:New(136, 251, 201, 332)
  })
end

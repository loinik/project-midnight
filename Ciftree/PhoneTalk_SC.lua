-- Midnight in Salem: the engine's PhoneTalk_SC (decompiled) with Carson Drew in Dagny's slot.
summary = AR:Summary({bg = "", env = ""})
Scene:Include("PhoneTalkLogic_SC")
local sink = AR:Sink({
  z = 10,
  active = function(this)
    -- MID: the drive into Salem is one long conversation; the phone works in the car
    return (Brain.InConvo_BR and not Brain.MID_InCar_BR) or Flags.InForcedConvo_FL
  end
})
Scene:Include("PhoneGlobals_Vert_SC")
MakePhoneFrame()
MakeAppBackground()
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
    if puzzle.state == "viewing" then
      Scene:Change("PhoneTalk_SC")
    else
      Scene:Change("PhoneMainMenu_SC")
    end
  end
})
MakeBackout({
  OnDone = function()
    Scene:EndStream(Scene.streamName)
    summary:Send("CellButton", "AnimateDown")
  end
})
MakeWallpaper()
MakeStatusBar("contacts")
MakeCharms()
if Scene.streamName == "ForcedCellphoneStream" then
  AreaTag("PreventLowerLeftMatte")
end
local greetScene = Load:Data("_Phone_ForceCall_GreetScene")
if greetScene then
  AR:Override({
    RunOnce = function(this)
      Brain.InConvo_BR = true
      Scene:BeginStream({
        stream = "CellphoneTalkStream",
        scene = greetScene,
        ends = "manual",
        captureInput = true
      })
      this:Done()
    end
  })
end

function StartPhoneConvo(scene)
  Log:Write("Starting phone convo...")
  StrTable.UI_PhoneConvoScene_ST = scene
  Scene:BeginStream({
    stream = "CellphoneTalkStream",
    scene = "PhoneBeginCall_SC",
    z = Scene:GetStreamZ(Scene.streamName) + 0.5,
    ends = "manual",
    inVP = false
  })
end

function HandleRegularPhoneConvo(scene)
  StartPhoneConvo(scene)
end

puzzle = MakePhoneTalkPuzzle({
  saveKey = "PhoneTalkLogic",
  defaultOVL = "UI_PhoneContacts_OVL",
  initialContact = Load:Data("_Phone_InitialContact"),
  contacts = {
    PNN = {
      sortName = Autotext.PHONE_Contact01,
      listSRC = Rect:New(235, 2, 545, 62),
      closeupSRC = Rect:New(0, 0, 233, 267),
      Available = function()
        return not Brain.TUT_InTutorial_BR and true
      end,
      OnCalled = function()
        HandleRegularPhoneConvo("PNN_Alpha_SC")
        Log:Write(string.format("Ned Called", nil))
      end
    },
    -- MID: SEA's Dagny slot (row 2 of UI_PhoneContacts_OVL) is Carson Drew
    PDS = {
      sortName = "Carson",
      listSRC = Rect:New(235, 64, 545, 124),
      closeupSRC = Rect:New(599, 2, 832, 267),
      Available = function()
        return not Brain.TUT_InTutorial_BR and true
      end,
      OnCalled = function()
        HandleRegularPhoneConvo("PCD_Alpha_SC")
        Log:Write(string.format("Carson called", nil))
      end
    },
    PAT = {
      sortName = Autotext.PHONE_Contact03,
      listSRC = Rect:New(235, 126, 545, 186),
      closeupSRC = Rect:New(834, 2, 1067, 267),
      Available = function()
        return not Brain.TUT_InTutorial_BR and Brain.PAT_NeedDistraction_Done_BR
      end,
      OnCalled = function()
        HandleRegularPhoneConvo("PAT_Alpha_SC")
        Log:Write(string.format("Alex called", nil))
      end
    },
    TUT_Ned = {
      ovl = "TUT_PhoneContactNed_OVL",
      sortName = Autotext.TUT_PhoneNed,
      listSRC = Rect:New(2, 269, 312, 329),
      closeupSRC = Rect:New(2, 2, 235, 267),
      Available = function()
        return Brain.TUT_InTutorial_BR
      end,
      OnCalled = function()
        HandleRegularPhoneConvo("TUT_PhoneCall_SC")
        Log:Format("Calling Tutorial Ned", nil)
      end
    }
  },
  spaceBetweenContacts = 10,
  callButton = {
    ovl = "UI_Phone_OVL",
    up = Rect:New(706, 275, 862, 327),
    down = Rect:New(706, 329, 862, 381),
    dest = Rect:New(706, 329, 862, 381):LeftTopSet(433, 389)
  },
  scrollbar = {
    ovl = "UI_Cell_TXT_OVL",
    source = Rect:New(362, 625, 379, 677),
    dest = Rect:New(657, 121, 668, 483)
  },
  contactCUDest = Point:New(395, 78),
  sources = {
    bg = Rect:New(1, 1, 333, 373)
  },
  onScreens = {
    main = Rect:New(344, 116, 676, 488),
    contactsList = Rect:LTWH(356, 40, 356, 362)
  },
  window = {deadZone = 10, scrollPixels = 25},
  cursors = {default = "PointHot", scrolling = "GrabHot"},
  sounds = {
    button = AR:Sound({
      sounds = "Beep_Single01_SFX",
      channel = "EngineFX",
      volume = 0.5,
      active = false
    })
  }
})
AR:Override({
  RunOnce = function(this)
    MakeStatusBar("contacts")
    
    function HandleRegularPhoneConvo(scene)
    end
  end,
  active = function(this)
    return Brain.Signal_Dead_BR
  end
})

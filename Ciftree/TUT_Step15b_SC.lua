Scene:Include("Eddy_Include_SC")
Scene:Include("TUT_Step15_SC")
Scene:Include("TUT_ButtonsTextBox_SC")
onScreens = CreateTutorialTextWithButtons({
  "TUT_STEP15",
  {
    "TUT_TextboxChoice_OVL",
    "TUT_TextBoxChoice_OVL"
  },
  source = {
    Rect:New(2, 2, 79, 36),
    Rect:New(81, 2, 158, 36)
  },
  offset = Point:New(0, -100)
})
AR:Button({
  hs = AR:Hotspot({
    cursor = "Point",
    onScreen = onScreens[1]
  }),
  baseOvl = AR:Overlay({
    ovl = "TUT_TextboxChoice_OVL",
    source = Rect:New(2, 2, 79, 36),
    onScreen = onScreens[1]
  }),
  downOvl = AR:Overlay({
    ovl = "TUT_TextboxChoice_OVL",
    source = Rect:New(2, 38, 79, 72),
    onScreen = onScreens[1]
  }),
  overOvl = AR:Overlay({
    ovl = "TUT_TextboxChoice_OVL",
    source = Rect:New(2, 38, 79, 72),
    onScreen = onScreens[1],
    localAlpha = 0.75
  }),
  OnUp = function()
    Save:Attic("TutorialReplay", true)
    Game:New()
  end
})
AR:Button({
  hs = AR:Hotspot({
    cursor = "Point",
    onScreen = onScreens[2]
  }),
  baseOvl = AR:Overlay({
    ovl = "TUT_TextboxChoice_OVL",
    source = Rect:New(81, 2, 158, 36),
    onScreen = onScreens[2]
  }),
  downOvl = AR:Overlay({
    ovl = "TUT_TextboxChoice_OVL",
    source = Rect:New(81, 38, 158, 72),
    onScreen = onScreens[2]
  }),
  overOvl = AR:Overlay({
    ovl = "TUT_TextboxChoice_OVL",
    source = Rect:New(81, 38, 158, 72),
    onScreen = onScreens[2],
    localAlpha = 0.75
  }),
  OnUp = function()
    if Flags.TUT_FromBadges_FL then
      Save:Attic("SkipToBadges", true)
    end
    Game:New()
  end
})

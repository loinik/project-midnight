Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step12bUI_SC"
}):Sum({}):Sink({
  z = 2,
  onScreen = Viewport.size
}):FlashingOverlay({
  "TUT_Arrow_OVL",
  1,
  0.5,
  source = Rect:New(2, 2, 71, 53),
  onScreen = Rect:LTWH(0, 0, 69, 51):CenterSet(Point:New(940, 346)),
  isAvailable = "TUT_Step12b_BR",
  isNotAvailable = "TUT_Step13_BR"
})
AR:Hotspot({
  cursor = "Point",
  onScreen = Rect:New(978, 321, 1024, 371),
  OnDone = function()
    menu:Restart()
    Scene:Change("CELLPHONESTREAM", "PhoneMainMenu_SC")
    Scene:EndStream("TUT_UISTREAM")
  end,
  z = 3
})
menu = AR:Sound({
  sounds = "Phone_UI_02_SFX",
  channel = "PhoneFX",
  active = false,
  volume = 0.4
})

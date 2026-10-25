Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step12UI_SC"
}):Sum({}):FlashingOverlay({
  "TUT_ArrowLeft_OVL",
  1,
  0.5,
  source = Rect:New(2, 2, 71, 53),
  onScreen = Rect:LTWH(0, 0, 69, 51):CenterSet(Point:New(150, 725)),
  isNotAvailable = "TUT_Step12_BR"
}):TUTText({
  "TUT_Step12a",
  offset = Point:New(0, 155),
  isAvailable = "TUT_Step12_BR",
  isNotAvailable = "TUT_Step12b_BR"
}):Sink({
  isAvailable = "TUT_VO5_Ready_BR"
}):Jump({
  "TUT_Step12bUI_SC",
  isAvailable = "TUT_VO5_Done_BR"
})

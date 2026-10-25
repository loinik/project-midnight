Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step4UI_SC"
}):Sum({}):FlashingOverlay({
  "TUT_Arrow_OVL",
  1,
  0.5,
  source = Rect:New(2, 2, 71, 53),
  onScreen = Rect:LTWH(0, 0, 69, 51):CenterSet(Point:New(715, 665))
}):Scene({
  "TUT_Step4bUI_SC"
}):Sum({})

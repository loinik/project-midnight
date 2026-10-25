Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step11UI_SC"
}):Sum({}):FlashingOverlay({
  "TUT_ArrowLeft_OVL",
  1,
  0.5,
  source = Rect:New(2, 2, 71, 53),
  onScreen = Rect:LTWH(0, 0, 69, 51):CenterSet(Point:New(225, 730)),
  isNotAvailable = "TUT_Used_BoxCutter_BR"
})

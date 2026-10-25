Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step3b_SC"
}):Sum({}):Sink({}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):Flagset({
  "TUT_Step3_BR",
  "end"
}):Land({
  "Back",
  RectB(-100),
  "TUT_LetterDown_SFX"
}):Overlay({
  "TUT_DeskLetter_OVL"
}):TUTPicText({
  "TUT_STEP3",
  {
    "UI_Cursors_OVL",
    "UI_Cursors_OVL"
  },
  source = {
    Rect:New(267, 88, 309, 126),
    Rect:New(311, 88, 361, 128)
  },
  offset = Point:New(270, 120)
})

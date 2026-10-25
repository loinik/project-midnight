Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step1_SC"
}):Sum({
  "TUT_Room_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):Voice({
  "TUT_VO1_SFX",
  "TUT_VO1_Done_BR",
  isAvailable = "TUT_VO1_Ready_BR"
}):Jump({
  "TUT_Step1b_SC",
  isAvailable = "TUT_VO1_Done_BR"
}):Scene({
  "TUT_Step1b_SC"
}):Sum({
  "TUT_Room_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):TUTPicText({
  "TUT_STEP1",
  {
    "UI_Cursors_OVL",
    "UI_Cursors_OVL",
    "UI_Cursors_OVL",
    "UI_Cursors_OVL",
    "UI_Cursors_OVL"
  },
  source = {
    Rect:New(72, 47, 109, 81),
    Rect:New(2, 88, 66, 118),
    Rect:New(116, 88, 151, 125),
    Rect:New(201, 88, 265, 118),
    Rect:New(111, 47, 148, 81)
  },
  offset = Point:New(0, -130)
}):Nav({
  "forward",
  RectV(240, -240),
  "TUT_Step2_SC"
}):Flagset({
  "TUT_Step1_BR",
  "end"
})

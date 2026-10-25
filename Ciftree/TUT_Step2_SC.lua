Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step2_SC"
}):Sum({
  "TUT_Desk_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):AreaTag({"TUT_Desk"}):Voice({
  "TUT_VO7_SFX",
  "TUT_VO7_Done_BR",
  isAvailable = "TUT_VO7_Ready_BR"
}):Jump({
  "TUT_Step2b_SC",
  isAvailable = "TUT_VO7_Done_BR"
}):Scene({
  "TUT_Step2b_SC"
}):Sum({
  "TUT_Desk_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):AreaTag({"TUT_Desk"}):TUTPicText({
  "TUT_STEP2",
  "UI_Cursors_OVL",
  source = Rect:New(159, 2, 200, 45),
  offset = Point:New(0, -125),
  isNotAvailable = "TUT_Step2_BR"
}):Launch({
  "Manipulate",
  Rect:New(319, 351, 687, 560),
  "TUT_Step3_SC",
  "TUT_LetterUp_SFX"
}):Jump({
  "TUT_Step4a_SC",
  isAvailable = "TUT_Step2_BR"
})

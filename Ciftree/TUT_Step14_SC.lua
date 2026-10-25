Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step14_SC"
}):Sum({
  "TUT_TableCandy_BG"
}):AreaTag({
  "PREVENTCELLPHONE"
}):TUTText({"TUT_STEP14"}):Flagset({
  "TUT_Step15_BR",
  "start"
}):Jump({
  "TUT_Step15_SC",
  isAvailable = "TUT_Task_Checked_BR"
})

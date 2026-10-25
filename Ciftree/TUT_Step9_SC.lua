Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step9_SC"
}):Sum({
  "TUT_Table_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):Overlay({
  "TUT_TableBoxCutter_OVL"
}):TUTText({
  "TUT_STEP9",
  offset = Point:New(0, 70)
}):HotVoice({
  "UseInventory",
  Rect:New(144, 61, 775, 545),
  "TUT_VO2_SFX",
  "TUT_Step9_BR"
}):Jump({
  "TUT_Step9b_SC",
  isAvailable = "TUT_Step9_BR"
}):Scene({
  "TUT_Step9b_SC"
}):Sum({
  "TUT_Table_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):TUTPicText({
  "TUT_STEP9c",
  "UI_Cursors_OVL",
  source = Rect:New(32, 2, 73, 45),
  isNotAvailable = "TUT_Step10_BR"
}):Launch({
  "Manipulate",
  Rect:New(800, 415, 1024, 585),
  "TUT_Step10_SC",
  "TUT_KnifeUp_SFX",
  isAvailable = "TUT_Hot_INV_BoxCutter_BR",
  z = 2
}):LaunchOvl({
  "TUT_TableBoxCutter_OVL",
  "TUT_Step10_SC",
  isAvailable = "TUT_Show_INV_BoxCutter_BR"
}):Jump({
  "TUT_Step11_SC",
  isAvailable = "TUT_Got_INV_BoxCutter_BR"
})
dummyHS = AR:Hotspot({
  onScreen = Rect:New(144, 61, 775, 545),
  cursor = "UseInventory",
  OnDone = function(this)
    this:Reset()
  end,
  active = function()
    return Brain.TUT_Step9_BR and not Brain.TUT_Step10_BR
  end
})

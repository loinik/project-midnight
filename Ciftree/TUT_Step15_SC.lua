Scene:Include("Eddy_Include_SC")
local messenger = AR:Override({
  RunOnce = function(this)
    this:Send("NotesTasklist", "Collapse")
  end,
  localName = "TutorialMessenger"
})
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step15_SC"
}):Sum({
  "TUT_TableCandy_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
}):Voice({
  "TUT_VO6_SFX",
  "TUT_VO6_Done_BR",
  isAvailable = "TUT_VO6_Ready_BR"
}):Jump({
  "TUT_Step15b_SC",
  isAvailable = "TUT_VO6_Done_BR"
}):Scene({
  "TUT_Step15b_SC"
}):Sum({
  "TUT_TableCandy_BG"
}):AreaTag({
  "PREVENTALLUIBUTMENU"
})

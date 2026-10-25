Scene:Include("Eddy_Include_SC")
AR:Override({
  RunOnce = function()
    Brain.TUT_Step12_BR = true
    Flags.CELLPHONE_PreventBackOut_FL = true
    AreaTag("PREVENTALLUIBUTMENU")
  end,
  active = function()
    return Scene:GetStreamScene("CELLPHONESTREAM") == "PHONEMAINMENU_SC" and not Brain.TUT_Step12_BR
  end
})
AR:Override({
  RunOnce = function()
    Scene:BeginStream({
      stream = "TUT_UIStream",
      scene = "TUT_Step12UI_SC",
      inVP = false
    })
  end,
  active = function()
    return Brain.TUT_VO4_Done_BR and not Brain.TUT_Step12_BR
  end
})
AR:Timer({
  duration = 0.75,
  OnDone = function()
    Brain.TUT_Step12b_BR = true
  end,
  active = function()
    return PhotoManager:GetCount("camera", nil) >= 1 and not Brain.TUT_Step12b_BR
  end
})
AR:Override({
  RunOnce = function()
    Brain.TUT_Step13_BR = true
    Flags.CELLPHONE_Enable_Talk_FL = true
    Flags.Cellphone_Enable_Camera_FL = false
    AreaTag("PREVENTALLUIBUTMENU")
    Scene:BeginStream({
      stream = "TUT_UIStream",
      scene = "TUT_Step13UI_SC",
      inVP = false
    })
  end,
  active = function()
    return Brain.TUT_Step12b_BR and Scene:GetStreamScene("CELLPHONESTREAM") == "PHONEMAINMENU_SC" and not Brain.TUT_Step13_BR
  end
})
AR:Override({
  RunOnce = function()
    Scene:EndStream("TUT_UIStream")
  end,
  active = function()
    return Scene:GetStreamScene("CELLPHONETALKSTREAM") == "PHONEBEGINCALL_SC"
  end
})
AR:Override({
  RunOnce = function()
    Flags.CELLPHONE_PreventBackOut_FL = false
    Scene:EndStream("CELLPHONESTREAM")
    Scene:Change("TUT_Step14_SC")
  end,
  active = function()
    return Brain.TUT_Step14_BR
  end
})
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step12_SC"
}):Sum({
  "TUT_TableCandy_BG"
}):AreaTag({
  "PREVENTNOTESTASK"
}):AreaTag({
  "PREVENTCELLPHONE"
}):Voice({
  "TUT_VO8_SFX",
  "TUT_VO4_Done_BR",
  isAvailable = "TUT_VO4_Ready_BR"
}):Voice({
  "TUT_VO5_SFX",
  "TUT_VO5_Done_BR",
  isAvailable = "TUT_VO5_Ready_BR"
}):TUTText({
  "TUT_Step12",
  isAvailable = "TUT_VO4_Done_BR",
  isNotAvailable = "TUT_Step12_BR"
}):TUTText({
  "TUT_Step12b",
  isAvailable = "TUT_VO5_Done_BR",
  isNotAvailable = "TUT_Step13_BR"
})
AR:Override({
  RunOnce = function()
    AreaUntag("PREVENTCELLPHONE")
  end,
  active = function()
    return Brain.TUT_VO4_Done_BR
  end
})

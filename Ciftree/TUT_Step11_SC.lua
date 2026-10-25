Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_Step11_SC"
}):Sum({
  "TUT_Table_BG"
}):AreaTag({
  "PREVENTCELLPHONE"
}):AreaTag({
  "PREVENTNOTESTASK"
}):TUTText({
  "TUT_STEP11",
  offset = Point:New(0, 70)
}):Scene({
  "TUT_Step11b_SC"
}):Sum({
  "TUT_TableCandy_BG"
}):AreaTag({
  "PREVENTCELLPHONE"
}):AreaTag({
  "PREVENTNOTESTASK"
}):Voice({
  "TUT_VO3_SFX",
  "TUT_VO3_Done_BR",
  isAvailable = "TUT_VO3_Ready_BR"
}):Jump({
  "TUT_Step12_SC",
  isAvailable = "TUT_VO3_Done_BR"
})
AR:Override({
  RunOnce = function()
    Scene:BeginStream({
      stream = "TUT_UIStream",
      scene = "TUT_Step11UI_SC",
      inVP = false
    })
  end,
  active = function()
    return not Brain.TUT_Used_BoxCutter_BR and Inventory.inHand ~= "TUT_INV_BOXCUTTER"
  end
})
AR:Override({
  RunOnce = function()
    Scene:EndStream("TUT_UIStream")
  end,
  active = function()
    return Inventory.inHand == "TUT_INV_BOXCUTTER"
  end
})
openBoxNAV = InventoryHotspot(AR:Hotspot({
  onScreen = Rect:New(144, 61, 775, 545),
  invItem = "TUT_INV_BOXCUTTER",
  OnCorrect = function(this)
    useKnifeSFX:Restart()
    Brain.TUT_Used_BoxCutter_BR = true
    Inventory:Remove("TUT_INV_BoxCutter")
    Scene:Change("TUT_Step11b_SC")
  end,
  OnIncorrect = function(this)
    Inventory.inHand = ""
    nancyHmmVO:Restart()
    this:Reset()
  end,
  active = function(this)
    return Brain.TUT_Got_INV_BoxCutter_BR and not Brain.TUT_Used_BoxCutter_BR
  end,
  z = 1
}))
useKnifeSFX = AR:Sound({
  sounds = {
    "TUT_KnifeUse_SFX"
  },
  channel = "FX1",
  volume = 0.85,
  active = false
})
nancyHmmVO = AR:Sound({
  sounds = {
    "Hm_1_SFX",
    "Hm_2_SFX",
    "Hm_3_SFX",
    "Hm_4_SFX",
    "Hm_5_SFX",
    "Hm_6_SFX",
    "Hm_7_SFX",
    "Hm_8_SFX",
    "Hm_9_SFX",
    "Hm_10_SFX"
  },
  channel = "PlayerVoice",
  volume = 0.85,
  RunOnce = function(this)
    locked = true
  end,
  OnDone = function(this)
    locked = false
  end,
  active = false
})

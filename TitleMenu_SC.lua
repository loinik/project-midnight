sum = AR:Summary({env = "OPN", bg = "Toast_BG"})
AreaTag("Medley_OPN")
tileMenuBG = AR:Movie({
  movie = "SEA_MainMenu_BG",
  source = Viewport.uiSize,
  onScreen = Viewport.uiSize,
  pauseOnLastFrame = true
})
if Flags.UI_SkipTitleFadeIn_FL then
  Flags.UI_SkipTitleFadeIn_FL = false
else
  coverBG = AR:Movie({
    movie = "SuperToast3_BG",
    source = Viewport.uiSize,
    onScreen = Viewport.uiSize,
    loop = true,
    z = 8
  })
  coverBG.animator[1].a = 1
  coverBG.animator[1].a:AddBlendLerp(1, 0)
end
local locked = false
titleOVL = AR:Overlay({
  ovl = "SEA_MainMenuTitle_OVL",
  source = Rect:New(0, 0, 808, 366),
  onScreen = Rect:New(108, 83, 916, 449),
  z = 4
})
nancyDrewOVL = AR:Overlay({
  ovl = "UI_MainMenuTitleND_OVL",
  source = Rect:New(0, 0, 808, 366),
  onScreen = Rect:New(108, 83, 916, 449),
  z = 3
})
mainMenuOVL = AR:Overlay({
  ovl = "UI_MainMenu_OVL",
  source = Rect:New(0, 0, 1024, 94),
  onScreen = Rect:New(0, 674, 1024, 768)
})
newGameButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(43, 730, 169, 760),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_MainMenu_Rollover_OVL",
    source = Rect:New(2, 2, 128, 32),
    onScreen = Rect:New(43, 730, 169, 760)
  }),
  OnDown = function(this)
    Scene:Change(Scene.streamName, "Badges_SC")
  end
})
loadGameButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(203, 730, 329, 760),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_MainMenu_Rollover_OVL",
    source = Rect:New(2, 34, 128, 64),
    onScreen = Rect:New(203, 730, 329, 760)
  }),
  OnDown = function(this)
    Scene:BeginStream({
      stream = "MainMenuPopup",
      scene = "UI_TM_Load_SC",
      captureInput = true
    })
  end
})
helpButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(364, 730, 473, 760),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_MainMenu_Rollover_OVL",
    source = Rect:New(2, 66, 111, 96),
    onScreen = Rect:New(364, 730, 473, 760)
  }),
  OnDown = function(this)
    Scene:Change("TUT_Start_SC")
  end
})
optionsButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(503, 730, 610, 760),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_MainMenu_Rollover_OVL",
    source = Rect:New(2, 98, 109, 128),
    onScreen = Rect:New(503, 730, 610, 760)
  }),
  OnDown = function(this)
    Scene:BeginStream({
      stream = "MainMenuPopup",
      scene = "UI_TM_Options_SC",
      captureInput = true
    })
  end
})
extrasButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(635, 730, 742, 760),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_MainMenu_Rollover_OVL",
    source = Rect:New(2, 130, 109, 160),
    onScreen = Rect:New(635, 730, 742, 760)
  }),
  OnDown = function(this)
    Scene:BeginStream({
      stream = "MainMenuPopup",
      scene = "UI_Extras_SC",
      captureInput = true
    })
  end
})
moreNDButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(761, 730, 884, 760),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_MainMenu_Rollover_OVL",
    source = Rect:New(2, 162, 125, 192),
    onScreen = Rect:New(761, 730, 884, 760)
  }),
  OnDown = function(this)
    Scene:BeginStream({
      stream = "MoreNDStream",
      scene = "UI_MoreND_SC",
      captureInput = true
    })
  end
})
quitButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(890, 730, 1006, 760),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_MainMenu_Rollover_OVL",
    source = Rect:New(2, 194, 118, 224),
    onScreen = Rect:New(890, 730, 1006, 760)
  }),
  OnDown = function(this)
    Game:Exit()
  end
})

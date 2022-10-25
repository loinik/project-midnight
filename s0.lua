sum = AR:Summary({env = "UI", bg = "toast_BG"})
disableUI = AR:Override({
  Run = function(this)
    this:Send("UIFrame", "Disable")
    this:Send("UIFrame", "Hide")
    this:Done()
  end
})
startManagers = AR:Override({
  RunOnce = function(this)
    PhotoManager:CreateStore("camera", 30)
    PhotoManager:CreateStore("wallpaper", 1)
    this:Done()
  end
})
HERLogoStillANIM = AR:Movie({
  movie = "HER_Logo_Still_ANIM",
  onScreen = Rect:New(0, 0, 800, 480):CenterSet(Viewport.uiSize.centerV),
  z = 5
})
partner1LogoANIM = AR:Movie({
  movie = "Partner1_Logo_ANIM",
  z = 5,
  active = function(this)
    return HERLogoStillANIM.done
  end
})
partner2LogoANIM = AR:Movie({
  movie = "Partner2_Logo_ANIM",
  z = 5,
  active = function(this)
    return partner1LogoANIM.done
  end
})
splashSFX = AR:Sound({
  sounds = "VEN_Splash_SFX",
  channel = "Theme",
  volume = 0.6,
  loop = false,
  active = function(this)
    return partner2LogoANIM.done
  end
})
hiLogoANIM = AR:Movie({
  movie = "HER_Logo_ANIM",
  z = 5,
  active = function(this)
    return partner2LogoANIM.done
  end,
  pauseOnLastFrame = false
})
dareToPlaySFX = AR:Sound({
  sounds = "Dare_to_Play_14_sfx",
  channel = "PlayerVoice",
  volume = 0.7,
  loop = false,
  active = function(this)
    return hiLogoANIM.frame >= 70
  end
})
oneSecond = AR:Timer({
  duration = 1,
  active = function(this)
    return hiLogoANIM.done
  end
})
nancyANIM = AR:Movie({
  movie = "ND_LOGO_ANIM",
  z = 5,
  pauseOnLastFrame = false,
  active = function()
    return oneSecond.done
  end
})
superToast_BG = AR:Movie({
  movie = "SuperToast_BG",
  z = 4,
  pauseOnLastFrame = true
})
tileMenuBG = AR:Movie({
  movie = "SEA_MainMenu_BG",
  z = 0,
  pauseOnLastFrame = true
})
fadeInAnim_TRNS = AR:Transformer({z = 4})
fadeInAnim_TRNS:Attach(superToast_BG)
local fadeTime1 = 4
fadein_OVR = AR:Override({
  RunOnce = function(this)
    fadeInAnim_TRNS.animator[1].a = 1
    fadeInAnim_TRNS.animator[1].a:AddBlendLerp(fadeTime1, 0)
  end,
  active = function(this)
    return nancyANIM.done
  end
})
nancyDrewOVL = AR:Overlay({
  ovl = "UI_MainMenuTitleND_OVL",
  source = Rect:New(0, 0, 808, 366),
  onScreen = Rect:New(108, 83, 916, 449),
  z = 4,
  active = function(this)
    return nancyANIM.done
  end
})
fourSeconds = AR:Timer({
  duration = 4,
  active = function(this)
    return nancyANIM.done
  end
})
twoSeconds = AR:Timer({
  duration = 2,
  active = function(this)
    return fourSeconds.done
  end
})
titleOVL = AR:Overlay({
  ovl = "SEA_MainMenuTitle_OVL",
  source = Rect:New(0, 0, 808, 366),
  onScreen = Rect:New(108, 83, 916, 449),
  z = 5
})
title_TRNS = AR:Transformer({z = 5})
title_TRNS:Attach(titleOVL)
title_TRNS.animator[1].a = 0
local fadeTime2 = 2
title_OVR = AR:Override({
  RunOnce = function(this)
    title_TRNS.animator[1].a:AddBlendSlerp(fadeTime2, 1)
  end,
  active = function(this)
    return twoSeconds.done
  end
})
fourSeconds2 = AR:Timer({
  duration = 6,
  active = function(this)
    return twoSeconds.done
  end
})
mainMenuOVL = AR:Overlay({
  ovl = "UI_MainMenu_OVL",
  source = Rect:New(0, 0, 1024, 94),
  onScreen = Rect:New(0, 674, 1024, 768)
})
menu_TRNS = AR:Transformer({})
menu_TRNS:Attach(mainMenuOVL)
menu_TRNS.animator[1].a = 0
local fadeTime3 = 1
menu_OVR = AR:Override({
  RunOnce = function(this)
    menu_TRNS.animator[1].a:AddBlendSlerp(fadeTime3, 1)
  end,
  active = function(this)
    return fourSeconds2.done
  end
})
oneSecond2 = AR:Timer({
  duration = 1,
  OnDone = function(this)
    Flags.UI_SkipTitleFadeIn_FL = true
    Initialize:Restart()
  end,
  active = function(this)
    return fourSeconds2.done
  end
})
Initialize = AR:Override({
  RunOnce = function(this)
    Brain.Bonus_BR = true
    PhoneManager:SetAntenna(2)
    Flags.Cellphone_Enable_Wallpaper_FL = true
    Flags.Cellphone_Enable_Menu_FL = true
    Flags.Cellphone_Enable_Camera_FL = true
    Flags.Cellphone_Enable_Gallery_FL = true
    Flags.Cellphone_Enable_Games_FL = true
    Flags.Cellphone_Enable_Messages_FL = true
    Flags.Cellphone_Enable_Options_FL = true
    Flags.Cellphone_Enable_Talk_FL = false
    Flags.Cellphone_Enable_Hints_FL = false
    Flags.Cellphone_Enable_Games_FL = Brain.Bonus_BR
    if Load:Attic("TutorialReplay") == true then
      Save:Attic("TutorialReplay", false)
      Scene:Change("TUT_Start_SC")
    elseif Load:Attic("SkipToBadges") == true then
      Save:Attic("SkipToBadges", false)
      Scene:Change("Badges_SC")
    else
      Scene:Change(Scene.streamName, "TitleMenu_SC")
    end
  end,
  active = false
})
defaultOptions = AR:Override({
  RunOnce = function(this)
    if Load:Attic("fastConvo") == nil then
      Save:Attic("fastConvo", true)
    end
  end
})
skip_HS = AR:Hotspot({
  onScreen = Viewport.uiSize,
  cursor = "None",
  OnDone = function(this)
    Sound:Stop("FX4")
    Sound:Stop("FX5")
    Sound:Stop("FX6")
  end
})
gotoScene1 = AR:Override({
  active = function(this)
    return skip_HS.done or Game.restarts > 0
  end,
  RunOnce = function(this)
    Sound:Stop("Theme")
    Initialize:Restart()
  end
})

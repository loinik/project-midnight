-- Midnight in Salem: Credits_SC — SEA's credits (decompiled) with the main menu
-- background (MID_MainMenu_BG, the web build's first credits concept) and the
-- credits theme looping under the scroll, as the Unity game plays it
-- (Mus_Main_Theme_Credits: starts with the scroll, 0.5 s fade-in, loops). Same logic as SEA: BeatGame attic
-- record after the ending, click ends (Game:New after the ending), and the
-- Bonus Edition goes on to BonusArt_SC when the music has faded.
sum = AR:Summary({
  env = "UI",
  bg = "Supertoast_BG"
})
AreaTag("Medley_NONE")
creditsBG = AR:Movie({
  movie = "MID_MainMenu_BG",
  pauseOnLastFrame = true
})
Scene:Include("PuzzleUtilities_SC")
local hasBeatGame = Load:Attic("GameComplete")
disableUI = AR:Override({
  RunOnce = function(this)
    if Flags.Opening_Cine_FL == true then
      if Brain.Meta_All_BR == true then
        Save:Attic("BeatGame", "WonAllMeta")
      elseif Load:Attic("BeatGame") ~= "WonAllMeta" then
        Save:Attic("BeatGame", "WonNotMeta")
      end
    end
  end
})
-- MID's credits are ~3.3x SEA's (817 lines vs 250 in 121 s)
local CreditScrollTime = hasBeatGame and 480 or 400
Scene:Include("ScrollingText_SC")
Credits = MakeVerticalScrollingText({
  texts = {"Credits"},
  scrollTime = CreditScrollTime
})
-- The game's white logo (from the Unity build) instead of the title text: it
-- rides the first text block's transformer, so it scrolls with the credits.
-- Credits_Text_SC leaves blank lines where it sits.
creditsLogo = AR:Overlay({
  ovl = "MID_CreditsLogo_OVL",
  source = Rect:New(0, 0, 400, 126),
  onScreen = Rect:New(312, Viewport.uiSize.top + 20, 712, Viewport.uiSize.top + 146)
})
Credits.TextObject[1].ObjectTransformer:Attach(creditsLogo)
Credits:Start()
startMusic = AR:Override({
  RunOnce = function(this)
    Sound:SetVolume("Theme", 0)
    theme:Restart()
    musicFadeIn.active = true
  end
})
musicFadeIn = MakeSoundFader({
  duration = 0.5,
  channel = "Theme",
  startVol = 0,
  endVol = 1,
  active = false
})
theme = AR:Sound({
  sounds = {"MID_CreditsTheme_SFX"},
  channel = "Theme",
  volume = 0.75,
  useCC = false,
  loop = true,
  active = false
})
musicFadeOut = MakeSoundFader({
  duration = 2,
  channel = "Theme",
  endVol = 0,
  active = false
})
delayFadeOut = AR:Timer({
  duration = CreditScrollTime,
  OnDone = function(this)
    musicFadeOut.active = true
  end,
  active = true
})
startAgainHS = AR:Hotspot({
  onScreen = Viewport.uiSize,
  cursor = "MenuHot",
  z = 10,
  OnDie = function(this)
    Sound:Stop("All")
  end,
  OnDone = function(this)
    Sound:Stop("All")
    if Flags.Opening_Cine_FL == true then
      Game:New()
    else
      Scene:EndStream(Scene.streamName)
    end
  end
})
bonusArtSC = AR:Override({
  RunOnce = function(this)
    Sound:Stop("All")
    if Flags.Opening_Cine_FL == true and Brain.Bonus_BR then
      Scene:Change(Scene.streamName, "BonusArt_SC")
    else
      Scene:EndStream(Scene.streamName)
    end
  end,
  active = function()
    return musicFadeOut.done
  end
})

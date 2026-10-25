sum = AR:Summary({env = "TUT", bg = ""})
AreaTag("Medley_TUT")
stopAmb1 = AR:Override({
  RunOnce = function(this)
    Sound:Stop("Ambient1")
    Sound:Stop("Ambient2")
    Sound:Stop("Ambient3")
    Sound:Stop("Ambient4")
    Sound:Stop("Ambient5")
    Sound:Stop("Ambient6")
    Sound:Stop("Ambient7")
    Sound:Stop("Ambient8")
  end
})
Scene:Include("AmbientSound_SC")
Scene:Include("SoundSystem_SC")
loopers = SoundSystem({
  channels = {"Ambient7", "Ambient8"}
})
ambSounds = MakeAmbientSoundSystem({
  "Ambient1",
  "Ambient2",
  "Ambient3",
  "Ambient4",
  "Ambient5",
  "Ambient6"
})
lawnmowerSFX = loopers:Ambient({
  sounds = {
    "TUT_Lawnmower_SFX"
  },
  channel = "Ambient7",
  GetVolume = function(this)
    if AreaManager:PlayerIsIn("TUT_Desk") then
      return 0.4
    else
      return 0.2
    end
  end,
  loop = true,
  PlayWhile = function(this)
    return true
  end
})
birdsSFX = loopers:Ambient({
  sounds = {
    "TUT_BirdChirping_SFX"
  },
  channel = "Ambient7",
  GetVolume = function(this)
    if AreaManager:PlayerIsIn("TUT_Desk") then
      return 0.65
    else
      return 0.4
    end
  end,
  loop = true,
  PlayWhile = function(this)
    return true
  end
})

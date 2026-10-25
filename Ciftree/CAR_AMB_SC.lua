-- Midnight in Salem: CAR ambience (the convertible). The game's intro timeline: the jet
-- fly-by at 0 s, Driving Pt1 at 1.03 s, then Pt2 loops under the whole conversation
-- (Medley_Car); DS_CAR_End_SC plays the Pt3 tag. Road noise loops quietly until the car
-- pulls up (DS_CAR_Arrived_BR).
sum = AR:Summary({env = "CAR", bg = ""})
-- the phone works from the first scene (calls, messages, games) — also for saves made in the car
Flags.Cellphone_Enable_Talk_FL = true
Flags.Cellphone_Enable_Messages_FL = true
Brain.MID_PhoneLive_BR = true
Flags.UI_SavePromptEnabled_FL = true -- "save before quitting?" (SEA sets it in its opening)
Brain.MID_InCar_BR = true
Flags.Cellphone_Enable_Games_FL = true
local started = false
jetSFX = AR:Sound({sounds = {"CAR_Plane_SFX"}, channel = "EngineFX", active = false})
musicPt1 = AR:Sound({
  sounds = {"Driving_Pt1_SFX"},
  channel = "Theme",
  active = false,
  OnDone = function()
    AreaTag("Medley_Car")
  end
})
-- Road bed: the game's own interior drive loop, the engine/tyres at speed under it, a breath
-- of wind past the windows and far-off birds. Loops of different lengths (17 / 15.8 / 13.5 /
-- 17 s) so the mix never repeats audibly; all quiet, under the voices and the music.
local function driving()
  return not Brain.DS_CAR_Arrived_BR
end
roadSFX = AR:Sound({sounds = {"CAR_DrivingInterior_Loop_SFX"}, channel = "Ambient8", volume = 0.3, loop = true, active = driving})
speedSFX = AR:Sound({sounds = {"CAR_DrivingSpeed_Loop_SFX"}, channel = "Ambient7", volume = 0.16, loop = true, active = driving})
windSFX = AR:Sound({sounds = {"CAR_Wind_Loop_SFX"}, channel = "Ambient6", volume = 0.07, loop = true, active = driving})
birdsSFX = AR:Sound({sounds = {"CAR_Birds_Loop_SFX"}, channel = "Ambient5", volume = 0.05, loop = true, active = driving})
AR:Override({
  Run = function(this)
    if not started then
      started = true
      jetSFX.active = true
      AR:Timer({
        duration = 1.03,
        OnDone = function()
          musicPt1.active = true
        end
      })
    end
  end
})

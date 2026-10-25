-- Midnight in Salem: the drive opens with a fade-in from black. Deirdre is already in
-- her seat under the black (her idle starts with the scene), the jet and the music come
-- from CAR_AMB_SC, and her first line starts as the plane fades away (3.5 s).
Brain.EddyFade_BR = true
Brain.DS_CAR_Arrived_BR = false
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({"DS_CAR_Intro_SC"}):Sum({"CAR_Convertible_BG"})
-- Started the way the convo player starts its clips (a constant-spec Xsheet never played).
idleXS = AR:Xsheet({xsheet = "", active = false})
AR:Override({
  RunOnce = function()
    idleXS.xsheet = "DS_CAR_CFid_Idle_XS"
    idleXS:Restart()
  end
})
-- Hold black a moment (the scene's first frames land while the videos load, which
-- used to swallow most of a plain fade), then dissolve in over Deirdre's idle.
Scene:Lock()
local fading = false
AR:Override({
  z = 10,
  active = function()
    return not fading
  end,
  Render = function(this)
    this:DrawRect(Viewport.size, Color:New(255, 0, 0, 0))
  end
})
AR:Timer({
  duration = 0.5,
  OnDone = function()
    fading = true
    MakeVideoFader({
      fade = "in",
      duration = 2,
      z = 10,
      OnDone = function()
        Brain.EddyFade_BR = false
        Scene:Unlock()
      end
    })
  end
})
AR:Timer({
  duration = 3.5,  -- as the plane (CAR_Plane_SFX, 4.5 s) fades away, she speaks
  OnDone = function()
    Scene:Change("DS_CAR_Convertible_SC")
  end
})

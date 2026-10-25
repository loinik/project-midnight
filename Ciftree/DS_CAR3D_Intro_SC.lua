-- Midnight in Salem (3D Deirdre): fade-in from black, Deirdre already driving;
-- jet and music from CAR_AMB_SC; her first line at 5.125 s.
Brain.EddyFade_BR = true
Brain.DS_CAR_Arrived_BR = false
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({"DS_CAR3D_Intro_SC"}):Sum({"CAR_Convertible_BG"}):Fade({"in", 2})
AR:Timer({
  duration = 5.125,
  OnDone = function()
    Scene:Change("DS_CAR3D_Convertible_SC")
  end
})

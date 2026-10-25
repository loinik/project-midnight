-- Midnight in Salem (Project Midnight): s2600
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHH"}):Scene({"s2600"}):Sum({"PHH_Node" .. N .. "0000_BG"})
  :Nav({"forwardLeft", RectM(200, 70, 824, 640), "s2640"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2601"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2603"})
  :Nav({"uTurn", RectB(560), "s2602"})
-- Arriving from the car (DS_CAR_End_SC faded out and set EddyFade_BR): hold black while
-- the hall loads, then dissolve in.
if Brain.EddyFade_BR then
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
  duration = 0.7,
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
end

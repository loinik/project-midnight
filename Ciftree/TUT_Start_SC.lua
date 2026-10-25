-- Midnight in Salem: the SEA tutorial, kept as is (Nancy's room, Ned's package).
-- Replaces the package stand-in; the tutorial ends with Game:New (title).
sum = AR:Summary({env = "TUT", bg = "Toast_BG"})
Brain.TUT_InTutorial_BR = true
sum:Send("UIFrame", "Enable")
sum:Send("UIFrame", "Show")
AR:Override({
  RunOnce = function(this)
    Scene:Change("TUT_Step1_SC")
  end
})

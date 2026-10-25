Scene:Include("Eddy_Include_SC")
Scene:Include("TUT_Step4_SC")
AR:Override({
  RunOnce = function()
    Scene:BeginStream({
      stream = "TUT_UIStream",
      scene = "TUT_Step4UI_SC",
      inVP = false
    })
  end,
  OnDie = function()
    Scene:EndStream("TUT_UIStream")
  end,
  active = function()
    return Brain.TUT_Step3_BR
  end
})
AR:Override({
  RunOnce = function()
    Scene:Change("TUT_Step4b_SC")
  end,
  active = function()
    return Flags.UI_TasklistExpanded_FL
  end
})

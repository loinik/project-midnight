Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_MWWConvo_SC"
}):Sum({})
AR:Override({
  RunOnce = function(this)
    Scene:Change("TUT_Topic1_SC")
  end
})

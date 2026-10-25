sum = AR:Summary({env = "", bg = ""})
sink = AR:Sink({
  cursor = "Magglass",
  onScreen = Viewport.uiSize,
  z = -10
})
Brain.InConvo_BR = false
Scene:Include("ForcedCall_SC")
EndForcedCall()
exitConvoSC = AR:Override({
  RunOnce = function(this)
    Scene:Change("PhoneEndCall_SC")
  end
})

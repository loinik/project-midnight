-- Midnight in Salem: inventory inspector for the spray can (right-click it in
-- the inventory). The same 3D view as picking it up (s2627), over the current
-- scene and lit by it; back closes it.
sum = AR:Summary({env = "", bg = ""})
sink = AR:Sink({z = -10})
sprayCan = AR:Model({
  model = "PHL_SprayCan_MDL",
  offsetY = 0.15,
  onScreen = Rect:New(0, 0, 1024, 690),
  dragArea = Rect:New(0, 0, 1024, 560),
  z = 5
})
backNAV = AR:Hotspot({
  onScreen = Rect:New(0, 560, 1024, 690),
  cursor = "Back",
  z = 6,
  OnDone = function(this)
    Scene:EndStream(Scene.streamName)
  end
})

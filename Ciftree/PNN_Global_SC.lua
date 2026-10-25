AreaTag("PNNConvo")
AreaTag("Medley_LowVolume")
sink = AR:Sink({
  cursor = "Magglass",
  onScreen = Viewport.uiSize,
  z = -10
})
AreaTag("PREVENTALLUIBUTMENU")
Brain.InConvo_BR = true
Scene:Include("ConvoSystem_SC")
Scene:Include("Table_SC")

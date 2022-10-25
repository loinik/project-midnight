sum = AR:Summary({bg = "", env = ""})
uiFrame = AR:Transformer({})
if not uiFrame:RegisterAlias("UIFrame") then
  error("UI frame could not register its alias")
end
lowerSink = AR:Sink({
  cursor = "Menu",
  handleKeys = false,
  onScreen = Rect:New(0, 690, 1024, 768),
  z = -10
})
uiFrame:Attach(lowerSink)
Scene:Include("UI_Frame_SC")
Scene:Include("UI_CellAnim_SC")
Scene:Include("UI_Inventory_SC")
Scene:Include("UI_NotesTasklist_SC")
Scene:Include("UI_Options_SC")
Scene:Include("Convo_SC")
Scene:Include("UI_CCtextDisplay_SC")
Scene:Include("UI_ProgressBar_SC")

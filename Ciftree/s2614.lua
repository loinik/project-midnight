-- Midnight in Salem (Project Midnight): s2614 — Koko Kringle bar, picked up.
-- The table keeps the OTHER bar (one-bar cell of PHK_KokoKringle_OVL — the
-- web build lost both because its three.js canvas covered the overlay); the
-- bar in Nancy's hands is the 3D model in front, dragged to turn it.
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHK"}):Scene({"s2614"}):Sum({"PHK_KokoKringleA" .. N .. "_BG"})
  :Nav({"back", RectB(560), "s2611"})
otherBar = AR:Overlay({
  ovl = "PHK_KokoKringle_OVL",
  source = Flags.Night_FL and Rect:New(86, 50, 170, 98) or Rect:New(86, 0, 170, 48),
  onScreen = Rect:New(499, 475, 583, 523),
  z = 1
})
kokoKringle = AR:Model({
  model = "PHK_KokoKringle_MDL",
  onScreen = Rect:New(0, 0, 1024, 690),
  dragArea = Rect:New(0, 0, 1024, 560),
  z = 5
})

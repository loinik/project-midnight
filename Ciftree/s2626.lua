-- Midnight in Salem (Project Midnight): s2626 — bookshelf. The spray can sits
-- on the shelf until Nancy takes it (s2627 → INV_SPRAYCAN).
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2626"}):Sum({"PHL_Bookshelf" .. N .. "_BG"})
  :Nav({"magGlassHot", RectM(435, 480, 575, 560), "s2628"})
  :Nav({"magGlassHot", RectM(720, 530, 845, 560), "s2629"})
  :Nav({"back", RectB(560), "s2623"})
if not Flags.MID_SprayCanTaken_FL then
  canOVL = AR:Overlay({
    ovl = "PHL_BookshelfSpraycan_OVL",
    source = Flags.Night_FL and Rect:New(200, 0, 397, 160) or Rect:New(0, 0, 197, 160),
    onScreen = Rect:New(228, 289, 425, 449),
    z = 1
  })
  canNAV = AR:Hotspot({
    onScreen = Rect:New(228, 289, 388, 449),
    cursor = "Manipulate",
    z = 2,
    OnDone = function(this)
      Scene:Change("s2627")
    end
  })
end

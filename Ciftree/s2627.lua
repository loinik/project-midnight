-- Midnight in Salem (Project Midnight): s2627 — the spray can, picked up from
-- the shelf as a 3D model. Nancy's line (the game's PHK Item_Rust-B-Gone) plays as
-- the close-up opens; no way back: drag to turn it, or click it to take it
-- (INV_SPRAYCAN — the can leaves the shelf).
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2627"}):Sum({"PHL_Bookshelf" .. N .. "_BG"})
takeSFX = AR:Sound({
  sounds = "PickUp_Candy08_SFX",
  channel = "FX1",
  volume = 0.85,
  active = false,
  OnDone = function(this)
    Scene:Change("s2626")
  end
})
foundVO = AR:Sound({
  sounds = "PHN_RustBGone_SFX",
  channel = "PlayerVoice",
  volume = 0.85
})
sprayCan = AR:Model({
  model = "PHL_SprayCan_MDL",
  offsetY = 0.15,
  onScreen = Rect:New(0, 0, 1024, 690),
  clickArea = Rect:New(400, 110, 624, 500),
  z = 5,
  OnClick = function(node)
    Inventory:Add("INV_SPRAYCAN")
    Flags.MID_SprayCanTaken_FL = true
    node.active = false
    takeSFX:Restart()
  end
})

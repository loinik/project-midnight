-- Midnight in Salem (Project Midnight): s2611
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHK"}):Scene({"s2611"}):Sum({"PHK_Node" .. N .. "0001_BG"})
  :Overlay({"PHK_KokoKringle_OVL", source = Flags.Night_FL and Rect:New(0, 50, 84, 98) or Rect:New(0, 0, 84, 48), onScreen = Rect:New(499, 475, 583, 523), z = 1})
  :Nav({"manipulate", RectM(481, 480, 601, 540), "s2614"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2612"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2610"})
  :Nav({"uTurn", RectB(560), "s2613"})

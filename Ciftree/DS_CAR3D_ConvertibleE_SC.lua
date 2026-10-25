-- Midnight in Salem (3D Deirdre): the conversation on the way - part 5/10.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_ConvertibleE_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible15_N_SFX",
    "DS_CAR_Convertible16_SFX",
    "DS_CAR_Convertible18_SFX"
  },
  "DS_CAR3D_ConvertibleF_SC"
})
DSCar3DLines({false, "CAR_Day1_Cutscene_Convertible_016_Deirdre_en", "CAR_Day1_Cutscene_Convertible_018_Deirdre_en"})

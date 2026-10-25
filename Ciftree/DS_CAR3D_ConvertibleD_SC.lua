-- Midnight in Salem (3D Deirdre): the conversation on the way - part 4/10.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_ConvertibleD_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible12_N_SFX",
    "DS_CAR_Convertible13_SFX",
    "DS_CAR_Convertible14_SFX"
  },
  "DS_CAR3D_ConvertibleE_SC"
})
DSCar3DLines({false, "CAR_Day1_Cutscene_Convertible_013_Deirdre_en", "CAR_Day1_Cutscene_Convertible_014_Deirdre_en"})

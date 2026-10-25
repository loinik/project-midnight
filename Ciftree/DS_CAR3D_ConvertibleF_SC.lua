-- Midnight in Salem (3D Deirdre): the conversation on the way - part 6/10.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_ConvertibleF_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible19_SFX",
    "DS_CAR_Convertible20_N_SFX",
    "DS_CAR_Convertible21_SFX"
  },
  "DS_CAR3D_ConvertibleG_SC"
})
DSCar3DLines({"CAR_Day1_Cutscene_Convertible_019_Deirdre_en", false, "CAR_Day1_Cutscene_Convertible_021_Deirdre_en"})

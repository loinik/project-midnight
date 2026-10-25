-- Midnight in Salem (3D Deirdre): the conversation on the way - part 1/10.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_Convertible_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible01_SFX",
    "DS_CAR_Convertible02_N_SFX",
    "DS_CAR_Convertible03_SFX"
  },
  "DS_CAR3D_ConvertibleB_SC"
})
DSCar3DLines({"CAR_Day1_Cutscene_Convertible_001_Deirdre_en", false, "CAR_Day1_Cutscene_Convertible_003_Deirdre_en"})

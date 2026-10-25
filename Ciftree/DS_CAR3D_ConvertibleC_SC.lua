-- Midnight in Salem (3D Deirdre): the conversation on the way - part 3/10.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_ConvertibleC_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible06_N_SFX",
    "DS_CAR_Convertible07_SFX"
  },
  "DS_CAR3D_ConvertibleD_SC"
})
DSCar3DLines({false, "CAR_Day1_Cutscene_Convertible_007_Deirdre_en"})

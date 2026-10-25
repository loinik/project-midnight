-- Midnight in Salem (3D Deirdre): the conversation on the way - part 9/10.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_ConvertibleI_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible28_N_SFX",
    "DS_CAR_Convertible29_SFX"
  },
  "DS_CAR3D_ConvertibleJ_SC"
})
DSCar3DLines({false, "CAR_Day1_Cutscene_Convertible_029_Deirdre_en"})

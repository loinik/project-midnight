-- Midnight in Salem (3D Deirdre): the conversation on the way - part 10/10.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_ConvertibleJ_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible30_N_SFX",
    "DS_CAR_Convertible31_SFX"
  },
  "DS_CAR3D_CaseDownload_SC"
})
DSCar3DLines({false, "CAR_Day1_Cutscene_Convertible_031_Deirdre_en"})

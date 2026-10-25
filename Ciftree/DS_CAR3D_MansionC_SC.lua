-- Midnight in Salem (3D Deirdre): question topic "Mansion" (conv_3_1) - part 3/3.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_MansionC_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload29_N_SFX",
    "DS_CAR_CaseDownload30_SFX"
  },
  "DS_CAR3D_End_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_030_Deirdre_en"})

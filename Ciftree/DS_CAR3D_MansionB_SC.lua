-- Midnight in Salem (3D Deirdre): question topic "Mansion" (conv_3_1) - part 2/3.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_MansionB_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload26_N_SFX",
    "DS_CAR_CaseDownload27_SFX",
    "DS_CAR_CaseDownload28_SFX"
  },
  "DS_CAR3D_MansionC_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_027_Deirdre_en", "CAR_Day1_Dialogue_CaseDownload_028_Deirdre_en"})

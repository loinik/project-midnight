-- Midnight in Salem (3D Deirdre): question topic "Family" (conv_1_1) - part 2/2.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_FamilyB_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload03_N_SFX",
    "DS_CAR_CaseDownload04_SFX",
    "DS_CAR_CaseDownload05_SFX"
  },
  "DS_CAR3D_CaseDownload_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_004_Deirdre_en", "CAR_Day1_Dialogue_CaseDownload_005_Deirdre_en"})

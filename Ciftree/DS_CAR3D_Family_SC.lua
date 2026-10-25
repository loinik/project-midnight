-- Midnight in Salem (3D Deirdre): question topic "Family" (conv_1_1) - part 1/2.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_Family_SC"
}):Sum({"CAR_Convertible_BG"}):Flagset({
  "DS_CAR3D_Family_Done_BR",
  "start"
}):Convo({
  {
    "DS_CAR_CaseDownload01_N_SFX",
    "DS_CAR_CaseDownload02_SFX"
  },
  "DS_CAR3D_FamilyB_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_002_Deirdre_en"})

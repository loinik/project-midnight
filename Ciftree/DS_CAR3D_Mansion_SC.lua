-- Midnight in Salem (3D Deirdre): question topic "Mansion" (conv_3_1) - part 1/3.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_Mansion_SC"
}):Sum({"CAR_Convertible_BG"}):Flagset({
  "DS_CAR3D_Mansion_Done_BR",
  "start"
}):Convo({
  {
    "DS_CAR_CaseDownload24_N_SFX",
    "DS_CAR_CaseDownload25_SFX"
  },
  "DS_CAR3D_MansionB_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_025_Deirdre_en"})

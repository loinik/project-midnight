-- Midnight in Salem (3D Deirdre): question topic "Teegan" (conv_2_2) - part 1/1.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_Teegan_SC"
}):Sum({"CAR_Convertible_BG"}):Flagset({
  "DS_CAR3D_Teegan_Done_BR",
  "start"
}):Convo({
  {
    "DS_CAR_CaseDownload07_N_SFX",
    "DS_CAR_CaseDownload18_SFX"
  },
  "DS_CAR3D_CaseDownload_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_018_Deirdre_en"})

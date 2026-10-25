-- Midnight in Salem (3D Deirdre): question topic "Mei" (conv_2_1) - part 1/4.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_Mei_SC"
}):Sum({"CAR_Convertible_BG"}):Flagset({
  "DS_CAR3D_Mei_Done_BR",
  "start"
}):Convo({
  {
    "DS_CAR_CaseDownload06_N_SFX",
    "DS_CAR_CaseDownload11_SFX"
  },
  "DS_CAR3D_MeiB_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_011_Deirdre_en"})

-- Midnight in Salem (3D Deirdre): question topic "Mei" (conv_2_1) - part 4/4.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_MeiD_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload16_N_SFX",
    "DS_CAR_CaseDownload17_SFX"
  },
  "DS_CAR3D_CaseDownload_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_017_Deirdre_en"})

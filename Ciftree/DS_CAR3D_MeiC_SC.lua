-- Midnight in Salem (3D Deirdre): question topic "Mei" (conv_2_1) - part 3/4.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR3D_MeiC_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload14_N_SFX",
    "DS_CAR_CaseDownload15_SFX"
  },
  "DS_CAR3D_MeiD_SC"
})
DSCar3DLines({false, "CAR_Day1_Dialogue_CaseDownload_015_Deirdre_en"})

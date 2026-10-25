Brain.InConvo_BR = false
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_EndCall_SC"
}):Sum({}):Flagset({
  "TUT_Step14_BR",
  "end"
}):Jump({
  "PhoneEndCall_SC"
})

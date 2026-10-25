Brain.InConvo_BR = false
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"TUT"}):Scene({
  "TUT_ConvoEnd_SC"
}):Sum({}):Flagset({
  "TUT_Step7_BR",
  "end"
}):Jump({
  "TUT_Node_SC",
  frame = 2
})

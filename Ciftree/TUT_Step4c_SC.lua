Scene:Include("Eddy_Include_SC")
Scene:Include("TUT_Step4_SC")
AR:Override({
  OnDie = function(this)
    this:Send("NotesTasklist", "Collapse")
  end
})

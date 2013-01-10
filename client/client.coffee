Meteor.subscribe "steps"
Meteor.subscribe "lanes"

# Meteor.startup ->
#   Meteor.autorun ->
#     unless Session.get("selected")
#       party = Parties.findOne()
#       Session.set "selected", party._id  if party

Template.board.steps = ->
  Steps.find()

Template.step.cells = ->
  Cells.find(step: @.id)

Template.cell.wipStickies = ->
  @wipStickies

Template.cell.doneStickies = ->
  @doneStickies

Template.sticky.btnProp = ->
  if Cells.findOne('wipStickies.id': @id) then "done" else "next"

Template.sticky.events
  'click': ->
    cell = Cells.findOne($or: [{ 'wipStickies.id': @id }, { 'doneStickies.id': @id }])
    Meteor.call("moveSticky", @id, cell.lane, cell.step + 1)
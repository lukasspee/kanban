# Lanes
# - name
# - cells: Cells
# - limit
Lanes = new Meteor.Collection 'lanes'

# Steps
# - name
# - cells: Cells
# - limit
# - type: [buffer|normal]
Steps = new Meteor.Collection 'steps'

# Board

# Users
# - from package

# Cells
# - wipStickies: [Stickies]
# - doneStickies: Stickies
# - lane: Lane
# - step: Step
Cells = new Meteor.Collection 'cells'

Meteor.methods
  moveSticky: (stickyId, laneId, stepId) ->
    console.log [stickyId, laneId, stepId]
    cell = Cells.findByLaneAndStep laneId, stepId
    console.log cell
    if cell
      sticky = _.find cell.wipStickies, (s) -> s.id is stickyId
      if sticky
        Cells.moveStickyToDone sticky, laneId, stepId
      else
        sticky = _.find cell.doneStickies, (s) -> s.id is stickyId
        Cells.moveStickyToNextLane sticky, laneId, stepId if sticky

Cells.moveStickyToDone = (sticky, laneId, stepId) ->
  Cells.update { lane: laneId, step: stepId }, $push:
    doneStickies: sticky
  Cells.update { lane: laneId, step: stepId }, $pull:
    wipStickies:
      id: sticky.id

Cells.moveStickyToNextLane = (sticky, laneId, stepId) ->
  Cells.update { lane: laneId + 1, step: stepId }, $push:
    wipStickies: sticky
  Cells.update { lane: laneId, step: stepId }, $pull:
    doneStickies:
      id: sticky.id

Cells.findByLaneAndStep = (laneId, stepId) ->
  Cells.findOne lane: laneId, step: stepId

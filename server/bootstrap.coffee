Meteor.startup ->
  _bootstrapLanes()
  _bootstrapSteps()
  _bootstrapCells()
  _bootstrapStickies()

lanes = [
    {
      id: 1
      name: 'Theme'
      limit: 3
    },
    {
      id: 2
      name: 'Bonzo'
      limit: 3
    },
    {
      id: 3
      name: 'Support tasks'
      limit: 3
    },
    {
      id: 4
      name: 'Bugs'
      limit: 3
    },
    {
      id: 5
      name: 'Tech debt/improvements'
      limit: 3
    }
  ]

  steps = [
    {
      id: 1
      name: 'Buffer 1'
      limit: 9
    },
    {
      id: 2
      name: 'Req. Analysis'
      limit: 2
    },
    {
      id: 3
      name: 'Story Writing + UX'
      limit: 2
    },
    {
      id: 4
      name: 'Buffer 2',
      limit: 5
    },
    {
      id: 5
      name: 'Tech. Analysis',
      limit: 4
    },
    {
      id: 6
      name: 'Development',
      limit: 4
    },
    {
      id: 7
      name: 'Acceptance',
      limit: 2
    }
  ]

_bootstrapLanes = ->
  Lanes.remove {}
  Lanes.insert lane for lane in lanes

_bootstrapSteps = ->

  Steps.remove {}
  Steps.insert step for step in steps

_bootstrapCells = ->
  Cells.remove {}

  for lane in lanes
    for step in steps
      Cells.insert
        wipStickies: []
        doneStickies: []
        lane: lane.id
        step: step.id

_bootstrapStickies = ->
  stickies = [
    {
      lane: 2
      step: 3
      title: 'Recommended Ideas'
      creationDate: new Date('2012-10-23')
    },
    {
      lane: 1
      step: 3
      title: 'Flickr Image Upload'
      creationDate: new Date('2012-11-05')
    }
  ]

  for sticky in stickies
    do (sticky) ->
      Cells.update { lane: sticky.lane, step: sticky.step }, $addToSet:
        wipStickies:
          title: sticky.title
          creationDate: sticky.creationDate







Meteor.startup ->
  # Stickies
  # - title
  # - creation date
  # - owner: User
  # - cell: Cell
  # stickies = [
  #   {
  #     title: ''
  #     creationDate:
  #     cell:
  #   },
  #   {
  #     title:
  #     creationDate:
  #     cell:
  #   }
  # ]

  # Lanes
  # - name
  # - cells: Cells
  # - limit
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

  # Steps
  # - name
  # - cells: Cells
  # - limit
  # - type: [buffer|normal]
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

  # Board

  # Users
  # - from package

  # Cells
  # - wipStickies: Stickies
  # - doneStickies: Stickies
  # - lane: Lane
  # - step: Step

  if Lanes.find().count() is 0
    Lanes.insert lane for lane in lanes

  if Steps.find().count() is 0
    Steps.insert step for step in steps

  if Cells.find().count() is 0
    for lane in lanes
      do (lane) ->
        for step in steps
          do (steps) ->
            Cells.insert
              wipStickies: []
              doneStickies: []
              lane: lane.id
              step: step.id




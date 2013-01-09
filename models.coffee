# Stickies
# - title
# - creation date
# - owner: User
# - cell: Cell
Stickies = new Meteor.Collection 'stickies'

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
# - wipStickies: Stickies
# - doneStickies: Stickies
# - lane: Lane
# - step: Step
Cells = new Meteor.Collection 'cells'
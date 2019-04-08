require_relative 'robot'
require_relative 'controller'
require_relative 'router'

controller = Controller.new(Robot.new)
router = Router.new(controller)

router.run

# Initialize Router class
class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts 'Welcome to your Toy Robot!'
    puts '           --           '

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.rename
    when 2 then @controller.start_robot
    when 3 then @controller.report_status
    when 4 then stop
    else
      puts 'Please press 1, 2, 3 or 4'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - Name / rename your robot'
    puts '2 - Place and move your robot'
    puts '3 - Recall the last position of your robot'
    puts '4 - Stop and exit the program'
  end
end

class Robot
  attr_accessor :name, :position

  def initialize
    @name = name || 'AwesomeO v1.0'
    @position = { x: 0, y: 0, direction: 'NORTH' } # TODO: for thing
  end

  def move(selected_move)
    if selected_move == 'MOVE'
      case @position[:direction]
      when 'NORTH'
        @position[:y] += 1
      when 'SOUTH'
        @position[:y] -= 1
      when 'EAST'
        @position[:x] += 1
      when 'WEST'
        @position[:x] -= 1
      end
    elsif selected_move == 'LEFT'
      case @position[:direction]
      when 'NORTH'
        @position[:direction] = 'WEST'
      when 'SOUTH'
        @position[:direction] = 'EAST'
      when 'EAST'
        @position[:direction] = 'NORTH'
      when 'WEST'
        @position[:direction] = 'SOUTH'
      end
    elsif selected_move == 'RIGHT'
      case @position[:direction]
      when 'NORTH'
        @position[:direction] = 'EAST'
      when 'SOUTH'
        @position[:direction] = 'WEST'
      when 'EAST'
        @position[:direction] = 'SOUTH'
      when 'WEST'
        @position[:direction] = 'NORTH'
      end
    end
  end
end

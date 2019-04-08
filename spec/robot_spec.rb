require 'robot'
require 'controller'

describe 'Robot' do
  describe "#move(selected move)" do
    it "moves robot" do
      robot = Robot.new
      robot.move('MOVE')
      expect(robot.position).to eq( {:direction=>"NORTH", :x=>0, :y=>1})
    end
  end
end



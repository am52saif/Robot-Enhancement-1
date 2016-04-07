describe Robot do

  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "If the robot is already dead, then raise an exception" do
        @robot.health = 0
        expect{@robot.heal!(10)}.to raise_error(Robot::RobotAlreadyDeadError)
    end
  end

  describe "#attack!" do
    it "If the robot is attacking something other than another Robot, then raise an exception" do
      robot2 = Laser.new
      expect{@robot.attack!(robot2)}.to raise_error(Robot::UnattackableEnemy)
    end
  end

end
class Robot 

  class RobotAlreadyDeadError < StandardError ; end
  class UnattackableEnemy < StandardError ; end
  
  attr_reader :position, :items
  attr_accessor :equipped_weapon, :health

  def initialize
    @position = [0,0]
    @health = 100
    @items = []
  end

  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def move_up
    position[1] += 1
  end

  def move_down
    position[1] -= 1
  end

  def pick_up(item)
    if item.is_a? Weapon
      @equipped_weapon = item
    end
    if items_weight < 250
      @items.push(item)
      true
    end
  end

  def items_weight
      sum = 0 
      @items.each{|item| sum += item.weight}
      sum
  end

  def wound(robot_damage)
    health<robot_damage ? @health=0 : @health -= robot_damage
  end

  def heal(robot_revive)
      health+robot_revive < 100 ? @health += robot_revive : @health=100
  end

  def attack(enemy)
      unless @equipped_weapon.nil?
        @equipped_weapon.hit(enemy)
      else
        enemy.wound(5)
      end
  end

  def attack!(enemy)
    if enemy.is_a? Item
      raise UnattackableEnemy, "Cannot Attack an Item!"
    else
      attack(enemy)
    end
  end

  def heal!(robot_revive)
    if @health <= 0 
     raise RobotAlreadyDeadError, "Dude The Robot is Dead!!" 
    else
      heal(robot_revive)
    end
  end

end

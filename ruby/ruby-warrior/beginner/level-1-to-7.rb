# Code inside this file could be cleaner.

class Player

  def initialize
    @been_to_wall = false
  end

  def play_turn(warrior)

    if warrior.feel.wall?
      warrior.pivot!
    elsif not have_been_to_wall? warrior and warrior.feel(:backward).empty?
      warrior.walk! :backward
    elsif warrior.feel(:backward).captive?
      warrior.rescue! :backward
    elsif warrior.feel.empty?
      if need_rest? warrior
        if can_rest? warrior
          warrior.rest!
        elsif health_decreased? warrior and low_health? warrior
          warrior.walk! :backward
        else
          warrior.walk!
        end
      else
        warrior.walk!
      end
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end

    @health = warrior.health

  end

  def have_been_to_wall? warrior
    @been_to_wall |= warrior.feel(:backward).wall?
  end

  def need_rest?(warrior)
    warrior.health < 20
  end

  def can_rest?(warrior)
    not @health.nil? and not health_decreased? warrior
  end

  def health_decreased?(warrior)
    warrior.health < @health
  end

  def low_health?(warrior)
    warrior.health < 13
  end
end

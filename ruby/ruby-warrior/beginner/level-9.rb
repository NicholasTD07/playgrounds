class Player
  def play_turn(warrior)
    w = warrior

    if taking_shots? w and w.feel.empty?
      w.walk!
    elsif w.feel.captive?
      w.rescue!
    elsif w.feel.wall?
      w.pivot!
    elsif not w.feel.empty?
      w.attack!
    elsif has_only_enemy? w.look
      w.shoot!
    elsif no_enemies_on_both_sides? w and needs_rest? w
        w.rest!
    else
      w.walk!
    end

    @health = warrior.health
  end

  def no_enemies_on_both_sides?(warrior)
    (not has_any_enemy? warrior.look) and (not has_any_enemy? warrior.look :backward)
  end

  def has_only_enemy?(spaces)
    any_enemy = has_any_enemy spaces
    any_captive = spaces.any? { |s| s.captive? }
    any_enemy and not any_captive
  end

  def has_any_enemy?(spaces)
    spaces.any? { |s| s.enemy? }
  end

  def needs_rest?(warrior)
    warrior.health < 20
  end

  def taking_shots?(warrior)
    (not @health.nil?) and (warrior.health < @health)
  end

  def has_only_enemy?(spaces)
    any_enemy = spaces.any? { |s| s.enemy? }
    any_captive = spaces.any? { |s| s.captive? }
    any_enemy and not any_captive
  end

end

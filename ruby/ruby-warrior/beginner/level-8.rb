class Player
  def play_turn(warrior)
    if has_only_enemy? warrior.look
      warrior.shoot!
    elsif warrior.feel.empty?
      warrior.walk!
    elsif warrior.feel.captive?
      warrior.rescue!
    end
  end

  def has_only_enemy?(spaces)
    any_enemy = spaces.any? { |s| s.enemy? }
    any_captive = spaces.any? { |s| s.captive? }
    any_enemy and not any_captive
  end
end

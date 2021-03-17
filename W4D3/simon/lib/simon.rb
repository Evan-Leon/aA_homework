require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    until game_over
      take_turn 

    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    input = self.require_sequence
    unless game_over
      self.round_success_message
      @sequence_length += 1
    
    end

  end

  def show_sequence
    self.add_random_color
    p seq
  end

  def require_sequence

  end

  def add_random_color
    num = rand(0..3)
    seq << COLORS[num]
  end

  def round_success_message
    puts "Great round you got it!"
  end

  def game_over_message
    puts "Too bad you lost, you'll get it next time!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end
end


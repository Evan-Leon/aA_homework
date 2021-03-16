class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2 
    @cups = Array.new(14){Array.new}
    place_stones 
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i ==6 || i == 13
        @cups[i] += [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
       raise 'Invalid starting cup'
    end
    if @cups[start_pos].empty? 
      raise 'Starting cup is empty'
    end
     
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    counter = start_pos 
   
    while !stones.empty?
      counter += 1 
      if counter > 13
        counter = 0
      end

      if counter == 6 
        @cups[6]<< stones.pop if current_player_name == @player1
      elsif counter == 13
        @cups[13]<< stones.pop if current_player_name == @player2
      else 
        @cups[counter] << stones.pop 
      end
    end
    render
    next_turn(counter)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else 
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all?{|cup| cup.empty?} || @cups[7...13].all?{|cup| cup.empty?}

    
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length 

    if @cups[6].length > @cups[13].length
      return @player1 
    else  
      return @player2
    end
  end
end

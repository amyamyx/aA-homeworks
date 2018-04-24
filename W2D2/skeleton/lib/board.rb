class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times { cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 || start_pos < 1
  end

  def make_move(start_pos, current_player_name)
    num_of_stones = @cups[start_pos].length
    i = start_pos + 1

    @cups[start_pos] = []

    until num_of_stones == 0
      skipped_i = current_player_name == @name1 ? 13 : 6

      unless i % 14 == skipped_i
        @cups[i % 14] << :stone
        num_of_stones -= 1
      end

      i += 1
    end
    render
    next_turn(i)

    store_i = current_player_name == @name1 ? 6 : 13
    switch  = nil
    prompt = nil
    if @cups[i % 14] == [:stone]
      switch = :switch
    end

    if i % 14 == store_i
      prompt = :prompt
    end
    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

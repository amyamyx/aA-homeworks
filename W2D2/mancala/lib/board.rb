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

    #take out the stones to hold in hand before distributing
    @cups[start_pos] = []

    skipped_i = current_player_name == @name1 ? 13 : 6
    distribue_stones(i, skipped_i, num_of_stones)
    render
    next_turn(i)

    store_i = current_player_name == @name1 ? 6 : 13
    switch  = nil
    prompt = nil
    if @cups[i] == [:stone]
      switch = :switch
    end

    if i == store_i
      prompt = :prompt
    end


  end

  def distribue_stones(i, skipped_i, num_of_stones)
    until num_of_stones == 0
      i %= 14
      unless i == skipped_i
        @cups[i] << :stone
        num_of_stones -= 1
      end
      i += 1
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
    @cups[0, 6].all?(&:empty?) || @cups[7, 6].all?(&:empty?)
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when 1 then @name1
    when -1 then @name2
    when 0 then :draw
    else
      nil
    end
  end
end

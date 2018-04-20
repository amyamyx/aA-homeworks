class Map

  def initialize(map = [])
    @map = map
  end

  def assign(key, value)
    if key?(key)
      idx = lookup(key)
      @map[idx][1] = value
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    keys = []
    @map.each { |pair| keys << pair.first }
    keys.index(key)
  end

  def key?(key)
    @map.each { |pair| return true if pair.first == key}
    false
  end

  def remove(key)
    idx = lookup(key)
    @map.delete_at(idx)
  end

  def show
    p @map
  end
end

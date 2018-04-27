class LRUCache


  def initialize(cache_size)
    @cache_size = cache_size
    @cache = Hash.new
    @thread_num = 0
  end

  def count
    @cache.length
  end

  def add(el)
    @thread_num += 1
    @cache[el] = @thread_num
    eject_lcu if count == 5
  end

  def show
    sort_cache.keys
  end

  private

  def least_thread_num
    @cache.values.min
  end

  def eject_lcu
    @cache.delete_if { |k, num| num == least_thread_num }
  end

  def sort_cache
    @cache.sort_by {|_, thread| thread }.to_h
  end
end

if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  p johnny_cache.count == 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  p johnny_cache.show == [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end

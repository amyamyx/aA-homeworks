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
    p sort_cache.keys
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

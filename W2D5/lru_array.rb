class LRUCache

   def initialize(size)
     @size = size
     @cache = []
   end

   def count
     @cache.length
   end

   def add(el)
     @cache.delete(el) if @cache.include?(el)
     @cache << el
     @cache.shift if count > 4
   end

   def show
     p @cache
   end
end

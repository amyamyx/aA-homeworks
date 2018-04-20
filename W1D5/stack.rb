class Stack
  attr_accessor :ivar

  def initialize(ivar = [])
    @ivar = ivar
  end

  def add(el)
    ivar.push(el)
  end

  def remove
    ivar.pop
  end

  def show
    p ivar
  end
end

# s = Stack.new
# s.add(1)
# s.show
# s.add(2)
# s.show
# s.add(3)
# s.show
# s.add(4)
# s.show
# s.remove
# s.show
# s.remove
# s.show
# s.remove
# s.show

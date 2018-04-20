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
    ivar
  end
end

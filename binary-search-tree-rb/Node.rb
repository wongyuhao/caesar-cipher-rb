class Node 
  include Comparable

  attr_accessor :value, :left, :right
  def initialize(val=nil)
    @value = val
    @left = nil
    @right =nil
  end

  def <=>(other)
    self.value <=> other.value
  end

  def is_leaf?
    return self.left.nil? && self.right.nil?
  end

  def one_child?
    return (self.left.nil?||self.right.nil?) && !self.is_leaf?
  end
end
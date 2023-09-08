class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
    @value = value
    @parent = nil 
    @children = []
  end 

  def parent=(node)
    if !node
      return nil
    end 
    if !node.children.include?(self)
      @parent = node
      node.children << self
    end 
  end 
end

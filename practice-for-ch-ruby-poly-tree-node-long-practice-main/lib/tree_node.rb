class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node == nil
      @parent = node
      return nil
    end

    if @parent != nil && !node.children.include?(self)
      old_parent = @parent
      @parent = node
      node.children << self
      old_parent.remove_child(self)
      return self
    end

    if !node.children.include?(self)
      @parent = node
      node.children << self
    end

  end

  def add_child(node)
    if !@children.include?(node)
      node.parent = self
    end
  end

  def remove_child(node)
    if @children.include?(node)
      node.parent = nil
      @children.delete_if(node)
    else
      raise 'Node is not a child'
    end
  end

  def inspect
    self.value
  end

end

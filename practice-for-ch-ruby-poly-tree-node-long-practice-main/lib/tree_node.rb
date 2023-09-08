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
      old_parent = self.parent
      old_parent.remove_child(self)
      @parent = node
      node.children << self
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
      @children.delete_if {|element| element == node}
    else
      raise 'Node is not a child'
    end
  end
  def dfs(target)
    return self if self.value == target

    @children.each do |child|
      dfs_child = child.dfs(target)
      return dfs_child if dfs_child != nil
    end

    return nil
  end

  def bfs(target)
    queue = []
    queue << self
    while queue.length > 0
      head = queue.shift
      return head if head.value == target
      head.children.each do |child|
        queue << child
      end
    end

    return nil
  end

  def inspect
    self.value
  end
end

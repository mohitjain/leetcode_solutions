require_relative 'queue'

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(data = nil)
    construct_from_level_order(data) if data.is_a? Array
  end

  def construct_from_level_order(data)
    queue = Queue.new
    data.each do |item|
      node = TreeNode.new item
      self.root = node if root.nil?
      unless queue.empty?
        if queue.front.left.nil?
          queue.front.left = node
        else
          queue.front.right = node
          queue.dequeue
        end
      end
      queue.enqueue node
    end
  end

  def to_s
    output = []
    queue = Queue.new [root]
    until queue.empty?
      element = queue.dequeue
      if element.nil?
        output.push(nil)
      else
        output.push(element.val)
        queue.enqueue(element.left)
        queue.enqueue(element.right)
      end

    end
    output.reverse.drop_while(&:nil?).reverse
  end

  def inorder(node = root)
    return if node.nil?

    inorder(node.left)
    p node.val
    inorder(node.right)
  end

  def postorder(node = root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    p node.val
  end

  def preorder(node = root)
    return if node.nil?

    p node.val
    preorder(node.left)
    preorder(node.right)
  end

end


# tree = BinaryTree.new([1,2,3,4,5])
# tree.inorder
# tree.postorder
# tree.preorder

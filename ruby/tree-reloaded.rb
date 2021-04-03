class Tree
  attr_accessor :children, :node_name

  def initialize(name="", children=[], tree_map={})
    @children = children
    @node_name = name

    build(tree_map)
  end

  def build(tree_map = {})
    unless tree_map.empty?
      @node_name.clear()
      @children.clear()

      if tree_map.length > 1
        raise "Too many root nodes. #{tree_map}"
      end

      node_keys     = tree_map.keys
      @node_name    = node_keys[0]
      node_children = tree_map[node_name]

      node_children.each do | children_name, next_level_children |
        @children.append(Tree.new("", [], { children_name => next_level_children }))
      end
    end
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end
end

map  = { 'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {} }, 'uncle' => { 'child 3' => {}, 'child 4' => {} } } }
puts map
ruby_tree = Tree.new("", [], map)

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "Visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }
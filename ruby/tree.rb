 ​​class Tree​​
   # attr_accessor: defines an instance variable, an accesor and a setter.
 ​​  attr_accessor :children, :node_name​​
 ​​​​
   # This is how a constructor is defined.
 ​​  def initialize(name, children=[])​​
     # The @ sign denotes an instance variable. @@ denotes a class variable (one value per class).
 ​​    @children = children​​
 ​​    @node_name = name​​
 ​​  end​​
 ​​​​
 ​​  def visit_all(&block)​​
 ​​    visit &block​​
 ​​    children.each {|c| c.visit_all &block}​​
 ​​  end​​
 ​​​​
 ​​  def visit(&block)​​
 ​​    block.call self​​
 ​​  end​​
 ​​end​​
 ​​​​
 ​​ruby_tree = Tree.new( "Ruby",​​
 ​​  [Tree.new("Reia"),​​
 ​​   Tree.new("MacRuby")] )​​
 ​​​​
 ruby_tree_2 = Tree.new( "Ruby2",​​
 ​​  [Tree.new("Reia2"),​​
 ​​   Tree.new("MacRuby2")] )​​
 ​
 ​​puts "Visiting a node"​​
 ​​ruby_tree.visit {|node| puts node.node_name}​​
 ​​puts​​
 ​​​​
 ​​puts "visiting entire tree"​​
 ​​ruby_tree.visit_all {|node| puts node.node_name}​​

 puts ruby_tree_2.
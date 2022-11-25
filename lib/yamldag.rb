require 'plexus'
require 'yaml'

class YamlDag
  include Plexus

  def initialize(filepath) 
    @dag = DirectedGraph.new # alias of Digraph
    @filepath = filepath
  end

  def build
    add_vertices_and_edges
    # is cycle graph ?
    if @dag.cyclic?
      # puts "strong_components  ==> #{@dag.strong_components}"
      @nodes = @dag.strong_components.select{|a| a.length > 1}
      @nodes.each do | ns |
        puts "--------------cyclic------------------"
        puts "#{ns.reverse.join('-->')}-->#{ns.reverse.first}"
      end
    end
    if @dag.acyclic? 
      # puts "--------------topsort------------------"
      # puts "#{@dag.topsort}"
      puts "--------------dfs------------------"
      puts "#{@dag.dfs}"
      puts "--------------bfs------------------"
      puts "#{@dag.bfs}"
    end
    puts "--------------visualize------------------"
    visualize
  end

  def vertices 
    puts "Vertices #{@dag.vertices}"
  end 

  def ancestors(task)
    dag.ancestors(task)
  end

  def root(task)
    ancestors(task).last
  end

  def visualize
    # just a graph.dot
    # filename = dag.dotty and puts "Created  xx #{filename}"
    filename = dag.write_to_graphic_file('svg') and puts "Created #{filename}"
  end

  private

  attr_reader :dag, :filepath

  def add_vertices_and_edges(tasks = yml_tasks)
    tasks.each_pair do |task, child_tasks|
      next if child_tasks.nil?
      child_tasks.keys.each do |child|
        # puts "Adding #{child}"
        # puts "ancestors #{ancestors(task)}"
        # puts "root #{root(task)}"
        dag.add_edge!(task, child)
      end
      add_vertices_and_edges(child_tasks)
    end
  end

  def yml_tasks
    @yml_tasks ||= YAML.load_file(filepath)
  end
end
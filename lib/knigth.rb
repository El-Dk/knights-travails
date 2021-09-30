# frozen_string_literal: true

require './lib/node'

# Knigth class definition
class Knigth
  STEPS = [[-1, 2], [-1, -2], [1, 2], [1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

  def initialize(position, target_position)
    @position = Node.new(position, [])
    @target_position = target_position
  end

  def move(node)
    possible_moves = []
    STEPS.each do |step|
      new_position = [node.position[0] + step[0], node.position[1] + step[1]]
      possible_moves << new_position if new_position[0].between?(0, 7) && new_position[1].between?(0, 7)
    end
    possible_moves
  end

  def create_moves(node)
    new_positions = move(node)
    new_nodes = []
    
    new_positions.each do |new_position|
      new_node = Node.new(new_position, node.path)
      # return new_node if new_node.position == @target_position

      new_nodes << new_node
    end
    new_nodes
  end
  
  def create_path
    nodes = [@position]
    node = nil
    loop do
      node = nodes.shift
      
      node.next_positions = create_moves(node) if node.next_positions.empty?
      
      nodes.concat(node.next_positions)
      break if(node.position == @target_position)      
    end
    node.path
  end  
end

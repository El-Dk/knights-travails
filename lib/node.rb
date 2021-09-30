# frozen_string_literal: true

# Node class definition
class Node
  attr_accessor :position, :next_positions, :path

  def initialize(position, path = [])
    @position = position
    @path = path + [position]
    @next_positions = []
  end
end

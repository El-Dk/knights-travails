# frozen_string_literal: true

require './lib/knigth'
cabashero = Knigth.new( [3, 3], [4, 3])
cabashero.knight_moves([0, 0],[1, 2])
cabashero.knight_moves([0, 0],[3, 3])
cabashero.knight_moves([3, 3],[0, 0])
cabashero.knight_moves([3, 3],[4, 3])

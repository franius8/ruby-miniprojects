class Board
    VALID_MOVES = [[1,2], [-1,2], [1,-2], [-1,-2], [2,1], [-2,1], [2,-1], [-2,-1]]
    
    def possible_moves(position)
        before_move = position
        result = []
        VALID_MOVES.each do |move|
           position[0] + 
        end
    end

    def valid?(position)
        position[0].between?(1,8) && position[1].between?(1,8)
    end
end
class Player

    attr_reader :name, :hp, :score

    MAX_HEALTH = 3

    def initialize name
        @name = name
        @hp = MAX_HEALTH
        @score = 0
    end


    def lose_live amount
        @hp -= amount
    end

    def correct_response amount
        @score += amount
    end

    def summary total_score
        "*#{@name}* \n 
        Score: #{@score} / #{total_score} \n 
        Lives: #{hp}" 
    end 

    def is_dead?
        @hp == 0
    end
        

end
class Questions
    attr_accessor :questions, :answers

    def initialize game_name
        @name = game_name
        @questions = []
        @answers = []
    end

    def make_question number_one, number_two
        @questions << ("What is #{number_one} + #{number_two}")
        @answers << number_one + number_two
    end

    def check_answer user_answer
        user_answer == @answers.last
    end 

end
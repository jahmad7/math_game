require './player'
require './questions'

class Game 
    attr_accessor :game_over, :current_turn, :players, :questions
    def initialize 
        @players = [
            Player.new("Player 1"),
            Player.new("Player 2"),
        ]
        @questions = Questions.new("Game 1")
        @current_turn = 1
        @game_over = false
    end 

    def next_turn
        @current_turn += 1
    end

    def end_game
        @game_over = true
        "GAME OVER ! \n
        #{players.last.name} wins! With a score of #{players.last.score} questions right!"
    end

    def run
        while (not game_over) do 
            puts
            puts "--- TURN #{@current_turn} ---"
            puts
            question_player = players.first
            questions.make_question rand(20), rand(20)
            puts "#{question_player.name}: #{questions.questions.last}"
            puts "#{questions.answers.last}"
            answer = (gets.chomp).to_i
            if questions.check_answer answer 
                question_player.correct_response 1
            else
                question_player.lose_live 1
            end

            puts 
            puts " == SUMMARY == "
            puts

            players.each do |player|
                puts player.summary(current_turn)
            end

            if question_player.is_dead?
                puts end_game
            end

            players.rotate!
            next_turn
        end 
    end

end
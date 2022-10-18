require_relative 'player.rb'
class Game
    def initialize()
        @player_1 = Player.new()
        @player_2 = Player.new()
        @current_player = @player_1
        @fragment=''
        @dictionary = {}
        words = File.open("dictionary.txt").readlines.map(&:chomp)
        words.each do |word|
            @dictionary[word]=0
        end
    end
    def next_player!
        if @current_player == @player_1
            previous_player = @current_player
            @current_player = @player_2
        else
            previous_player = @current_player
            @current_player = @player_1
    end
    def take_turn(player)

    end
    Checks that string is a letter of the alphabet and
     that there are words we can spell after adding it to the fragment
    def valid_play?(string)
        return false if string.length != 1
        alpha = [*'a'..'z', *'A'..'Z'].join('')
        new = @fragment + string
        if alpha.include?(string) && new
    end
    def play_round

    end
end
g = Game.new()
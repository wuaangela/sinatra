# In this introductory level project, you’ll use Sinatra to build a number guessing game.

# Goals
# It will:

# Generate a random number on startup
# Have a web page where you can enter a guess
# Tell you whether your guess was…
# Way too high
# Too high
# Correct
# Too low
# Way too low

require 'sinatra'
require 'sinatra/reloader'

set :NUMBER, rand(100)
msg = []
bgcolour = 'white'
@@triesleft = 5

get '/' do
    guess = params['guess'].to_i
    cheat = params['cheat']
    msg = check(guess)
    erb :index, :locals => {:number => settings.NUMBER, :msg => msg[0], :bgcolour => msg[1], :triesleft => @@triesleft, :cheat => cheat}
end 

def check(x) 
    @@triesleft -= 1

    if @@triesleft == 0
        settings.NUMBER = rand(100)
        @@triesleft = 5
        return ['Sorry, you lost. Try again with a new number!', 'white']
    else 
        case 
        when x == 0
            ['', '']
        when x > settings.NUMBER + 5
            ['Way too high!', 'red']
        when x > settings.NUMBER
            ['Too high!', 'pink']
        when x < settings.NUMBER - 5 
            ['Way too low!', 'red']
        when x < settings.NUMBER 
            ['Too low!', 'pink']
        when x == settings.NUMBER 
            ['You got it right! The secret number is ' + settings.NUMBER.to_s, 'green']
        else 
            'Not a valid input!'
        end
    end

   
end


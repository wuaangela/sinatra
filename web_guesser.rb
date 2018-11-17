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

NUMBER = rand(100)
msg = []
bgcolour = 'white'

get '/' do
    guess = params['guess'].to_i
    msg = check(guess)
    erb :index, :locals => {:number => NUMBER, :msg => msg[0], :bgcolour => msg[1]}
end 

def check(x) 
    case 
    when x > NUMBER + 5
        ['Way too high!', 'red']
    when x > NUMBER
        ['Too high!', 'pink']
    when x < NUMBER - 5 
        ['Way too low!', 'red']
    when x < NUMBER 
        ['Too low!', 'pink']
    when x == NUMBER 
        ['You got it right! The secret number is ' + NUMBER.to_s, 'green']
    else 
        'Not a valid input!'
    end
end


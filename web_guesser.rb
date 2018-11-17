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

get '/' do
  "The secret abc is #{rand(101)}"
end

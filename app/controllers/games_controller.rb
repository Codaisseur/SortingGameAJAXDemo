class GamesController < ApplicationController
  def play
    @game = Game.create!
  end

  def update
    @game = Game.find(params[:id])

    guess = params[:commit]

    @game.check_guess(guess)

    render action: :play
  end
end

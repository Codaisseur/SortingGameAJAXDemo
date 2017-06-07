class GamesController < ApplicationController
  def play
    @game = Game.create!
  end

  def update
    @game = Game.find(params[:id])

    guess = params[:commit]

    @game.check_guess(guess)

    respond_to do |format|
      format.html { render action: :play }
      format.json { render json: @game }
    end
  end
end

class Game < ApplicationRecord
  before_validation :randomize_color!, unless: :persisted?

  validates_presence_of :current_color

  def check_guess(guess)
    if guess == current_color
      self.score += 1
    else
      self.score -= 2
    end

    randomize_color!

    save
  end

  private

  def randomize_color!
    self.current_color = random_color
  end

  def random_color
    %w(red green).sample
  end
end

class AddCurrentColorToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :current_color, :string
  end
end

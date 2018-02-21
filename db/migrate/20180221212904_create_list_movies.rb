class CreateListMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :list_movies do |t|
      t.integer :list_id
      t.integer :movie_id

      t.timestamps
    end
  end
end

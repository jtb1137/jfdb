class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections, id: false do |t|
      t.integer :movie_id
      t.integer :list_id
      t.datetime :date_added

      t.timestamps
    end
  end
end

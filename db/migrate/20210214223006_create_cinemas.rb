class CreateCinemas < ActiveRecord::Migration[5.2]
  def change
    create_table :cinemas do |t|
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end

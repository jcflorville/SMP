class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title_eng
      t.string :title_esp
      t.integer :stock
      t.string :category
      t.string :imdb
      t.string :description
      t.string :quality
      t.string :type_movie
      t.string :menu
      t.string :cast
      t.string :directors
      t.string :code
      t.has_attached_file :picture

      t.timestamps
    end
  end
end

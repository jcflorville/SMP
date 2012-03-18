class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :movie
      t.references :user

      t.timestamps
    end
    add_index :sales, :movie_id
    add_index :sales, :user_id
  end
end

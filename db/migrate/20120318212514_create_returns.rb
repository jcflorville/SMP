class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.references :movie
      t.references :user

      t.timestamps
    end
    add_index :returns, :movie_id
    add_index :returns, :user_id
  end
end

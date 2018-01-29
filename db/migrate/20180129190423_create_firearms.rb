class CreateFirearms < ActiveRecord::Migration[5.1]
  def change
    create_table :firearms do |t|
      t.string :name
      t.integer :round_count
      t.integer :user_id
  end
end

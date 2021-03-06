class CreateComebacks < ActiveRecord::Migration
  def change
    create_table :comebacks do |t|
      t.string "text"
      t.integer "user_id"
      t.integer "insult_id"
      t.integer "score", :default => 0
      t.timestamps null: false
    end
    add_index("comebacks", "insult_id")
    add_index("comebacks", "text")
  end
end

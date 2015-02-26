class CreateComebacks < ActiveRecord::Migration
  def change
    create_table :comebacks do |t|
      t.string "text"
      t.string "user"
      t.integer "insult_id"
      t.timestamps null: false
    end
    add_index("comebacks", "insult_id")
    add_index("comebacks", "text")
  end
end

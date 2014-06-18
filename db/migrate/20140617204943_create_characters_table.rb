class CreateCharactersTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character_name, null: false
      t.string :actor_name, null: false
      t.integer :television_show_id, null: false
      t.text :description
    end
  end
end

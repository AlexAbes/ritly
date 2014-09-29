class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :link
      t.integer :hash_code

      t.timestamps
    end
  end
end

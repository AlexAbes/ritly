class ChangeHashCodeToString < ActiveRecord::Migration
  def up
  	change_column :links, :hash_code, :string
  end
  def down
  	change_column :links, :hash_code, :integer
  end
end

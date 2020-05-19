class AddpasswordToComment < ActiveRecord::Migration
  def change
    add_column :comments, :password, :string
  end
end

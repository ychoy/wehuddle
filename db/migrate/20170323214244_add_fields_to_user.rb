class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :biography, :text
    add_column :users, :username, :string
  end
end

class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduction, :string
    add_column :users, :birthplace, :string
  end
end

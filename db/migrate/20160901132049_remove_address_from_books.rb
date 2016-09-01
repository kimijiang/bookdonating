class RemoveAddressFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :address, :string
  end
end

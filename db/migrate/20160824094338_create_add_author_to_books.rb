class CreateAddAuthorToBooks < ActiveRecord::Migration
  def change
    create_table :add_author_to_books do |t|

      t.timestamps null: false
    end
  end
end

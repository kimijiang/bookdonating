class AddSubjectAgeDescriptionDonatedAtDoneeIdToBooks < ActiveRecord::Migration
  def change

    add_column :books, :age, :integer
    add_column :books, :description, :string
    add_column :books, :donated_at, :timestamp
    add_column :books, :donee_id, :integer
    add_column :books, :subject, :string

  end
end

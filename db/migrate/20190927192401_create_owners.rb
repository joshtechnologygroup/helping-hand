class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :team
      t.string :organisation
      t.string :designation
      t.timestamps

      t.belongs_to :user, index: true
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 0
      t.integer :gender
      t.string :phone_number, limit: 15
      t.string :github_username, limit: 50
      t.integer :experience
      t.string :designation, limit: 50
      t.datetime :last_seen, default:-> { 'CURRENT_TIMESTAMP' }


      t.timestamps
    end
  end
end

class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :last_updated_at

      t.timestamps
    end
  end
end

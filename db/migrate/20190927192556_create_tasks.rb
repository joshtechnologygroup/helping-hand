class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :problem
      t.text :solution
      t.integer :upvotes, null: false, default: 0
      t.timestamps

      t.belongs_to :source

    end

    create_table :task_owners do |t|
      t.belongs_to :task
      t.belongs_to :owner

    end

    create_table :task_keyword_collections do |t|
      t.belongs_to :task
      t.belongs_to :keyword_collection

    end
  end
end

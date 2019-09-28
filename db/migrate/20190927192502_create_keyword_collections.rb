class CreateKeywordCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :keyword_collections do |t|
      t.string :keyword
      t.string :similar_keyword

      t.timestamps
    end
  end
end

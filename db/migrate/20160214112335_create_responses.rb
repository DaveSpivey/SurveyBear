class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :survey_id, :null => false
      t.integer :choice_id, :null => false
      t.references :taker
      t.timestamps(null: false)
    end
  end
end

class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.datetime :timestamp
      t.string :url
      t.references :visitor, foreign_key: true

      t.timestamps
    end
  end
end

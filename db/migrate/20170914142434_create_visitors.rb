class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|

      t.timestamps
    end
  end
end

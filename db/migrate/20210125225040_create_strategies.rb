class CreateStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :strategies do |t|
      t.string :goal
      t.string :path
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.references :action, null: false, foreign_key: true

      t.timestamps
    end
  end
end

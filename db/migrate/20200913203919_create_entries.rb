class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.datetime :date
      t.decimal :value
      t.text :memo
      t.references :account, null: false, foreign_key: true
      t.references :result_center, null: false, foreign_key: true

      t.timestamps
    end
  end
end

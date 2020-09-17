class CreateResultCenters < ActiveRecord::Migration[6.0]
  def change
    create_table :result_centers do |t|
      t.string :name

      t.timestamps
    end
  end
end

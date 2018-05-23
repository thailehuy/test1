class CreateSeeders < ActiveRecord::Migration[5.1]
  def change
    create_table :seeders do |t|
      t.boolean :consumed, default: false
      t.string :seed

      t.timestamps
    end
  end
end

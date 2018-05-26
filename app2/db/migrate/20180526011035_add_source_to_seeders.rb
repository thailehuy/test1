class AddSourceToSeeders < ActiveRecord::Migration[5.1]
  def change
    add_column :seeders, :source, :string, default: '1'
  end
end

class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :number_inhabitants
      t.integer :year_founded
    end
  end
end

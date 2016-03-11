class AddCreatedByToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :created_by, :integer
  end
end

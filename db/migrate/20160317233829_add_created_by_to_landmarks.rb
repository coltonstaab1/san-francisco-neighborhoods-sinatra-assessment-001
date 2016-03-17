class AddCreatedByToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :created_by, :integer
  end
end

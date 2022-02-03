class RenameHolesToHoleCount < ActiveRecord::Migration[5.2]
  def change
    rename_column :golf_courses, :holes, :hole_count 
  end
end

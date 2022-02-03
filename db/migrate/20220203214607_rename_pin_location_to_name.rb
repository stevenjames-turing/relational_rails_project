class RenamePinLocationToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :holes, :pin_location, :name
  end
end

class AddPositionToReason < ActiveRecord::Migration[7.1]
  def change
    add_column :reasons, :position, :integer
  end
end

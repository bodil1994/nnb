class RenameColumnNameInTransfers < ActiveRecord::Migration[7.0]
  def change
    rename_column :transfers, :transfert_type, :transfer_type
  end
end

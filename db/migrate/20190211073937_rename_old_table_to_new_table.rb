class RenameOldTableToNewTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :attendences, :time_logs
  end
end

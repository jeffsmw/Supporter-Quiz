class AddColumnDoneUndone < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :status, :string #put in the new migration
  end
end

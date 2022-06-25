class AddStateToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :title, :string, null: true
  end
end

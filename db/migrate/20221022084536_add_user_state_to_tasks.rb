class AddUserStateToTasks < ActiveRecord::Migration[6.1]
  def change
    #すでにあるデータに デフォルト値0をセットする
    add_column :tasks, :user_id, :integer, default: 0, null: false
    #デフォルト値をnullにする
    change_column_default :tasks, :user_id, nil
  end
end

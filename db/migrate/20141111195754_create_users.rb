class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end

    change_table :todo_items do |t|
      t.integer :user_id
    end
  end
end

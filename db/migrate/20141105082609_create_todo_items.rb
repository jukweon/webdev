# db/migrate/20141105082609_create_todo_items.rb
class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :description
      t.string :due_date
    end
  end
end

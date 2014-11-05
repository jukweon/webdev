ActiveRecord::Schema.define(version: 20141105082609) do

  create_table "todo_items", force: true do |t|
    t.string "description"
    t.string "due_date"
  end

end

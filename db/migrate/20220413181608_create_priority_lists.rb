class CreatePriorityLists < ActiveRecord::Migration[7.0]
  def change
    create_table :priority_lists do |t|
      t.string :priority_list

      t.timestamps
    end
  end
end

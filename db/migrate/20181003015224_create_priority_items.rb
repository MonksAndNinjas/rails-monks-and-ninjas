class CreatePriorityItems < ActiveRecord::Migration[5.2]
  def change
    create_table :priority_items do |t|
      t.string :title
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end
end

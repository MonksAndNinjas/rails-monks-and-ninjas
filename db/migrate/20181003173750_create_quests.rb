class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :title
      t.string :description
      t.belongs_to :user
      t.belongs_to :objective

      t.timestamps
    end
  end
end

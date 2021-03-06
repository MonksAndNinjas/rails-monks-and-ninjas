class CreateInspirations < ActiveRecord::Migration[5.2]
  def change
    create_table :inspirations do |t|
      t.string :source
      t.string :image
      t.string :link
      t.string :video
      t.string :content
      t.string :about
      t.belongs_to :user

      t.timestamps
    end
  end
end

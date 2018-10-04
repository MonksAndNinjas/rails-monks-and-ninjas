class CreateDisciplines < ActiveRecord::Migration[5.2]
  def change
    create_table :disciplines do |t|
      t.string :title
      t.string :content
      t.string :duration

      t.timestamps
    end
  end
end

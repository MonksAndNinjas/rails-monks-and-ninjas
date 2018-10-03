class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :title
      t.string :task
      t.string :type

      t.timestamps
    end
  end
end

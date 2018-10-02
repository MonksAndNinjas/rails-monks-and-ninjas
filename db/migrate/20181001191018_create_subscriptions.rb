class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.decimal :amount, :precision => 5, :scale => 2
      t.integer :due_day
      t.belongs_to :user

      t.timestamps
    end
  end
end

class CreateFamilyMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :family_members do |t|
      t.string :name
      t.string :location
      t.date :birthdate
      t.string :relationship
      t.string :contact
      t.string :relationship_status
      t.belongs_to :user

      t.timestamps
    end
  end
end

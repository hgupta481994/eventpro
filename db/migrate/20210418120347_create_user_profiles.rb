class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string 			:name, null: false
      t.boolean			:gender, null: false, default: false
      t.references	:user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

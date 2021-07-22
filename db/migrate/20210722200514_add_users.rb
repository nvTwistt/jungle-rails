class AddUsers < ActiveRecord::Migration
  def change
    create_table "users", force: :cascade do |info|
      info.string :first_name
      info.string :last_name
      info.string :email
      info.string :password_digest
      info.timestamps null: false
    end
  end
end

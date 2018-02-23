class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password
      t.string :profile_picture
      t.string :background_picture
      t.string :bio

      t.timestamps
    end
  end
end

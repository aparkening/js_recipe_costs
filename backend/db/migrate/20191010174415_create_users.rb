class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.boolean :admin, default: false
      t.string :organization
      t.string :uid
      t.string :email

      t.timestamps
    end
  end
end

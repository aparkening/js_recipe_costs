class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :password_digest
      t.boolean :admin, default: false
      t.string :organization
      t.string :uid
      t.string :email, null: false, default: ""

      t.timestamps
    end
  end
end

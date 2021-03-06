class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, index: true,null: false,unique: true
      t.string :password_digest, index: true,null: false
      t.timestamps
    end
  end
end

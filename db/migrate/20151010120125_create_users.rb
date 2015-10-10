class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :encrypted_password, default: '', null: false
      t.string :api_token
    end
  end
end

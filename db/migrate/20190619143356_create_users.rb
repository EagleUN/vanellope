class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :uuid, limit: 36, primary: true, null: false
    	t.string :name,				null: false, default: ""
      t.string :last_name,		null: false, default: ""
    	t.string :username, 		null: false, unique: true
    	t.string :email, 			null: false, index: true, unique: true
    	t.string :password_digest
    	t.string :role, 			null: false, default: 'user'
    	t.datetime :last_login
    	
    	t.timestamps
    end
  end
end

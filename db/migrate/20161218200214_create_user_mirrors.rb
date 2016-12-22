class CreateUserMirrors < ActiveRecord::Migration[5.0]
  def change
    create_table :user_mirrors do |t|
      t.string   :name
    	t.integer  :user_id
      t.integer  :mirror_id
     
      t.timestamps
    end
  end
end

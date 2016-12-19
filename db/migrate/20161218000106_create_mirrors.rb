class CreateMirrors < ActiveRecord::Migration[5.0]
  def change
    create_table :mirrors do |t|
      t.string  :name
    	t.string  :person_id
    	t.integer :owner_id
      t.string  :email
      t.string  :password_digest

      t.timestamps
    end
  end
end

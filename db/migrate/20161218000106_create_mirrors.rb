class CreateMirrors < ActiveRecord::Migration[5.0]
  def change
    create_table :mirrors do |t|
    	t.string :face_id
    end
  end
end

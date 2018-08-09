class CreatePastes < ActiveRecord::Migration[5.2]
  def change
    create_table :pastes do |t|
    	t.string :title
    	t.text :content
    	t.belongs_to :user, optional: true
      t.timestamps
    end
  end
end

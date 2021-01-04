class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: { to_table: :users }    
      t.string :title, null: false 
      t.text :body, null: false 
      
      t.timestamps
    end
  end
end


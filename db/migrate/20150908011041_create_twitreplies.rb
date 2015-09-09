class CreateTwitreplies < ActiveRecord::Migration
  def change
    create_table :twitreplies do |t|
      
      t.integer   :posting_id
      t.string    :repline

      t.timestamps null: false
    end
  end
end

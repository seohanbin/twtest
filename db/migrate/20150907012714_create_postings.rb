class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      
      t.string    :dname
      t.string    :dpass
      t.string    :dcont

      t.timestamps null: false
    end
  end
end

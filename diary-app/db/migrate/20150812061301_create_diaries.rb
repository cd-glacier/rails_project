class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
			t.integer :number
      t.integer :date
      t.text :content

      t.timestamps
    end
  end
end

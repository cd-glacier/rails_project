class AddNumberToDiary < ActiveRecord::Migration
  def change
    add_column :diaries, :number, :integer
  end
end

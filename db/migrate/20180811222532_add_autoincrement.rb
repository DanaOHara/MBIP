class AddAutoincrement < ActiveRecord::Migration[5.2]
  def change
    change_column :forum_posts, :id, :bigint, auto_increment: true
  end
end

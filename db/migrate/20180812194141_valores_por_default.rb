class ValoresPorDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :forum_posts, :mailed, :integer, :default => 0
    change_column :forum_posts, :messageformat, :integer,:default => 0
    change_column :forum_posts, :messagetrust,:integer, :default => 0
    change_column :forum_posts, :attachment, :string, :default => '0'
    change_column :forum_posts, :totalscore, :integer, :default => 0
    change_column :forum_posts, :mailnow, :bigint, :default => 0

  end
end

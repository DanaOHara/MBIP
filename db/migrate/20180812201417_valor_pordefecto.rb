class ValorPordefecto < ActiveRecord::Migration[5.2]
  def change
      change_column :forum_posts, :messageformat, :integer,:default => 1
  end
end

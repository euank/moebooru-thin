class DropDanbooruTextSearchConfiguration < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL.strip_heredoc
      DROP TEXT SEARCH CONFIGURATION IF EXISTS danbooru;
    SQL
  end
end

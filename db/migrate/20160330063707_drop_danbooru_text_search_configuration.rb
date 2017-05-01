class DropDanbooruTextSearchConfiguration < ActiveRecord::Migration
  def up
    execute <<-SQL.strip_heredoc
      DROP TEXT SEARCH CONFIGURATION IF EXISTS danbooru;
    SQL
  end
end

class Bookmark < ActiveRecord::Migration
  def self.up
    create_table "bookmarks" do |t|
		t.column "user_id", :integer
		t.column "url", :string
		t.column "name_alias", :string
		t.column "visibility", :string
	end
  end

  def self.down
    drop_table "bookmarks"
  end
end

class BookmarksController < ApplicationController
  before_filter :authenticate_user!   
    
  def create
    @bookmark = Bookmark.new(params[:bookmark])
	
	if (!(@bookmark.url[0..6] == "http://") || !(@bookmark.url[0..5] != "ftp://"))
	  @bookmark.url = "http://" + @bookmark.url
	end
	
	if (Bookmark.exists?(:user_id =>current_user.id, :url => @bookmark.url))
		flash[:alert] = @bookmark.url + " already exists as a bookmark, not added"
	else
		@bookmark.user_id = current_user.id
		@bookmark.save
	end
		
	redirect_to bookmarks_path
  end
  
  def edit
	in_place_edit_for :url, :name_alias, :visbility	
	redirect_to bookmarks_path
  end
  
  def destroy
    Bookmark.destroy(params["id"])
	redirect_to bookmarks_path
  end
end

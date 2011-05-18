class BookmarksController < ApplicationController
  # GET /heyworlds
  # GET /heyworlds.xml
  def index  
    respond_to do |format|
	  format.html # signed_in.html.erb
      #format.xml  { render :xml => @bookmarkviews }
    end
  end
  
  def create
    @bookmark = Bookmark.new(params[:bookmark])
	
	if (!(@bookmark.url[0..6] == "http://") || !(@bookmark.url[0..5] != "ftp://"))
	  @bookmark.url = "http://" + @bookmark.url
	end
	
	@bookmark.user_id = current_user.id
	@bookmark.save
	
	redirect_to bookmarks_path
  end
  
  def destroy
    Bookmark.destroy(params["id"])
	redirect_to bookmarks_path
  end
end

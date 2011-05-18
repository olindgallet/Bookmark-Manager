class BookmarksController < ApplicationController
  # GET /heyworlds
  # GET /heyworlds.xml
  def index  
    respond_to do |format|
	  @bookmark = Bookmark.new
      format.html # signed_in.html.erb
      #format.xml  { render :xml => @bookmarkviews }
    end
  end
end

# START:authentication
class BlogsController < ApplicationController

  before_filter :login_required

  def index
    @blogs = current_user.blogs.all

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @blogs }
      format.json { render :json => @blogs }
    end
  end

# END:authentication

  def show
    @blog = current_user.blogs.find(params[:id])


    respond_to do |format|
      format.html
      format.xml  { render :xml  => @blog }
      format.json { render :json => @blog }
    end
  end
  
  def new
    @blog = current_user.blogs.build

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @blog }
      format.json { render :json => @blog }
    end
  end

  def edit
    @blog = current_user.blogs.find(params[:id])
  end

  def create
    @blog = current_user.blogs.build(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog }
        format.xml  { render :xml  => @blog, :status => :created, :location => @blog }
        format.json { render :json => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
        format.json { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @blog = current_user.blogs.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog }
        format.any(:xml, :json) { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml  => @blog.errors, :status => :unprocessable_entity }
        format.json { render :json => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.any(:xml, :json) { head :ok }
    end
  end
    
# START:authentication
end
# END:authentication


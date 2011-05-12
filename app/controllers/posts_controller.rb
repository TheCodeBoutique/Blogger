class PostsController < ApplicationController

  before_filter :find_user

  def index
    @posts = @user.posts.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @posts }
    end
  end
  
  # other CRUD actions
  

  
  def show
    @post = @user.posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @post }
    end
  end
  
  def edit
    @post = @user.posts.find(params[:id])
  end
  
  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(user_posts_url(@user)) }
      format.json  { head :ok }
    end
  end
  

  
  def new
    @post = @user.posts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @post }
    end
  end
  

  
  def create
    @post = @user.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Registration was successfully created.'
        format.html { redirect_to([@user, @post]) }
        format.json  { render :json => @post, 
                             :status => :created, 
                             :location => [ @user, @post ] }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @post.errors, 
                             :status => :unprocessable_entity }
      end
    end
  end
  

  
  def update
    @post = @user.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Registration was successfully updated.'
        format.html { redirect_to([@user, @post]) }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @post.errors, 
                             :status => :unprocessable_entity }
      end
    end
    

  end
  


private

  def find_user
    @user = User.find(params[:user_id])
  end
end

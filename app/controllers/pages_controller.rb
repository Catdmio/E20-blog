class PagesController < ApplicationController
load_and_authorize_resource :user, :parent => false
# skip_authorization_check


  # GET /pages
  # GET /pages.json
  def index
    @users = User.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  #  @comments = @page.comments
  end
  # GET /posts/new
  def new
  #  @post = Pages.new
  end

  # GET /pages/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
  #  @post = Post.new(post_params)
    @page.user = current_user

    respond_to do |format|
      if @page.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @user.update(page_params)
        format.html { redirect_to pages_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @user}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
    #  @post = Post.find(params[:id]  )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_param
      params.require(:user).permit(:title, :email, :role)
    end
end

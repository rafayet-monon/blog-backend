module Api
  module V1
    class BlogsController < BaseController
      before_action :set_blog, only: %i[show update destroy]
      before_action :authenticate_user!, except: %i[index show]

      # GET /blogs
      def index
        @blogs = Blog.all

        render json: Api::V1::BlogListSerializer.new(@blogs).serializable_hash
      end

      # GET /blogs/1
      def show
        render json: Api::V1::BlogSerializer.new(@blog).serializable_hash
      end

      # POST /blogs
      def create
        @blog = Blog.new(blog_params.merge(user_id: current_user.id))

        if @blog.save
          render json: Api::V1::BlogSerializer.new(@blog).serializable_hash
        else
          error = ::CustomErrorService.new(source: 'create_blog',
                                           title:  @blog.errors.full_messages.to_sentence,
                                           code:   'err_003',
                                           status: 422)

          render json: Api::RequestErrorSerializer.new(error).serialized_json, status: 422
        end
      end

      # PATCH/PUT /blogs/1
      def update
        if @blog.update(blog_params)
          render json: Api::V1::BlogSerializer.new(@blog).serializable_hash
        else
          error = ::CustomErrorService.new(source: 'create_blog',
                                           title:  @blog.errors.full_messages.to_sentence,
                                           code:   'err_003',
                                           status: 422)

          render json: Api::RequestErrorSerializer.new(error).serialized_json, status: 422
        end
      end

      # DELETE /blogs/1
      def destroy
        @blog.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_blog
        @blog = Blog.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def blog_params
        params.require(:blog).permit(:title, :subtitle, :details, :cover_image)
      end
    end
  end
end
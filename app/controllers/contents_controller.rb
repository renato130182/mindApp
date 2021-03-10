class ContentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_content, only: [:show, :edit, :update, :destroy]
    def index
        @contents = current_user.contents
    end

    def new
        @content = Content.new
    end

    def create
        @content = current_user.contents.build(content_params)
        if @content.save
            redirect_to contents_path, notice: "Content successfully created!"
        else
            render :new
        end
    end
    def edit; end

    def update
        @content = Content.find(params[:id])
        if @content.update(content_params)
            redirect_to contents_path, notice: "Content successfully updated!"
        else
            redirect_to :edit
        end
    end

    def show; end

    def destroy        
        if @content.destroy
            redirect_to contents_path, notice: "Content successfully destroyed!"
        else
            redirect_to contents_path, notice: "Content destroy failed!"
        end
    end
    private 

    def set_content
        @content = Content.find(params[:id])
    end

    def content_params
        params.require(:content).permit(:title, :description)
    end
end
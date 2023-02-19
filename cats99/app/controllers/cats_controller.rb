class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def create
        @cat = Cat.new(strong_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    def new
        @cat = Cat.new
        @cat_colors = @cat.cat_colors
        render :new
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        @cat_colors = @cat.cat_colors
        render :edit

    end

    def show
        @cat = Cat.find_by(id: params[:id])
        @age = @cat.age
        render :show

    end

    def update
        @cat = Cat.find_by(id: params[:id])
        if @cat.update(strong_params)
            redirect_to cat_url(@cat)
        else
            render :edit
        end

    end

    private

    def strong_params
        params.require(:cat).permit(:birth_date, :name, :color, :sex, :description)
    end

end
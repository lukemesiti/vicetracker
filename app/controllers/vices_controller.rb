class VicesController < ApplicationController
    before_action :set_vice, only: [:show]

    def index
        @vices = Vice.all
    end

    def new
        @vice = Vice.new
    end

    def show
    end

    def create
        @vice = Vice.new(vice_params)

        respond_to do |format|
            if @vice.save
                format.html { redirect_to @vice, notice: 'Vice was successfully created.' }
            else
                format.html { render action: 'new' }
            end
        end
    end

    def destroy
        @vice.destroy
        respond_to do |format|
            format.html { redirect_to vices_path }
        end
    end

    private

    def set_vice
        @vice = Vice.find(params[:id])
    end

    def vice_params
      params.require(:vice).permit(:name)
    end

end
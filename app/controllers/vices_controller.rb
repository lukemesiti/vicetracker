class VicesController < ApplicationController
    before_action :set_vice, only: [:show, :destroy]

    def index
        @vices = current_user.vices
    end

    def new
        @vice = Vice.new
    end

    def show
        @subvices = current_user.subvices.where(vice: @vice)
    end

    def create
        @vice = Vice.find_by(id: params[:vice][:id])
        current_user.vices << @vice
        redirect_to vice_path(@vice), notice: 'Vice successfully created.'
    end

    def destroy
        current_user.vices.delete(@vice)
        redirect_to vices_path, notice: 'Vice successfully removed.'
    end

    private

    def set_vice
        @vice = current_user.vices.find(params[:id])
    end

end
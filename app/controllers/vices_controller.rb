class VicesController < ApplicationController
    before_action :set_vice, only: [:show, :destroy]

    def index
        @vices = current_user.vices
    end

    def new
        @vice = current_user.vices.new
    end

    def show
        @subvices = @vice.subvices
    end

    def create
        @vice = Vice.find_by(name: params[:vice][:name])
        current_user.vices << @vice
        redirect_to vices_path
    end

    def destroy
        current_user.vices.delete(@vice)
        redirect_to vices_path
    end

    private

    def set_vice
        @vice = current_user.vices.find(params[:id])
    end

end
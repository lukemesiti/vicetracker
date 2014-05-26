class SubvicesController < ApplicationController
    before_action :set_subvice, only: [:destroy, :edit, :update]
    before_action :set_vice, only: [:new, :create, :destroy, :edit, :update]

    def new
        @subvice = current_user.subvices.build(vice: @vice)
    end

    def create
        @subvice = Subvice.new(subvice_params)
        @subvice.user = current_user
        @subvice.vice = @vice
        @subvice.save

        redirect_to vice_path(@vice), notice: 'Subvice successfully created.'
    end

    def edit
    end

    def update
        @subvice.update(subvice_params)

        redirect_to @vice, notice: 'Subvice successfully updated.'
    end

    def destroy
        @subvice.destroy
        redirect_to vice_path(@vice), notice: 'Subvice successfully removed.'
    end

    private

    def set_subvice
        @subvice = current_user.subvices.find(params[:id])
    end

    def set_vice
        if params[:vice_id].present?
            @vice = current_user.vices.find(params[:vice_id])
        else
            @vice = @subvice.vice if @subvice.present?
        end
    end

    def subvice_params
        params.require(:subvice).permit(:name, :consumed_per_day, :cost_per_day, :goal)
    end
    
end
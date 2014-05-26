class PurchasesController < ApplicationController
    before_action :set_subvice, only: [:new, :create]
    before_action :set_vice, only: [:new, :create]

    def new
        @purchase = @subvice.purchases.new
    end

    def create
        @purchase = Purchase.new(purchase_params)
        @purchase.subvice = @subvice
        @purchase.save

        redirect_to vice_path(@vice), notice: 'Purchase sucessfully created.'
    end

    private

    def set_subvice
        @subvice = current_user.subvices.find(params[:subvice_id])
    end

    def set_vice
        @vice = @subvice.vice
    end

    def purchase_params
        params.require(:purchase).permit(:quantity, :cost)
    end

end
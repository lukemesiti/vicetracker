class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
    end

    def edit
    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to user_path(@user), notice: 'User successfully updated.' }
            else
                format.html { render action: 'edit' }
            end
        end
    end

    def destroy
        @user.destroy

        redirect_to new_user_session_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
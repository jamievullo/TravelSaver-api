class UsersController < ApplicationController

    def index
        @users = User.all
        if @users
            render json: {
            users: @users, except: [:password, :password_digest]
            }
        else
            render json: {
            status: 500,
            errors: ['No Users Found']
            }
        end
    end

    def show
        @user = User.find(params[:id])
    if @user
        render json: {
            user: @user, except: [:password, :password_digest]
        }
        else
        render json: {
            status: 500,
            errors: ['User Not Found']
        }
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
        login!
        render json: {
            status: :created,
            user: @user, except: [:password, :password_digest]
        }
        else 
        render json: {
            status: 500,
            errors: @user.errors.full_messages
        }
        end
    end

        private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end

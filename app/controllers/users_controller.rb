class UsersController < ApplicationController
    # GET /users
    def index
        users = User.all

        render json: users, status: :ok
    end

    # GET /users/:id
    def show
        id = params[:id]
        user = User.find(id)

        render json: user, status: :ok
    end

    # POST /users
    def create
        full_name = params[:full_name]
        email = params[:email]
        age = params[:age]

        user = User.new(full_name: full_name, email: email, age: age)

        if user.save
            render json: user, status: :ok
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        id = params[:id]
        user = User.find(id)

        if user.update(full_name: params[:full_name], email: params[:email], age: params[:age])
            render json: user
        else
            render json: { error: "Unable to update user."}
        end
    end

    def destroy
        id = params[:id]
        user = User.find(id)

        if user.destroy
            render json: { message: "Successfully deleted user."}
        else
            render json: { error: "Unable to delete user."}
        end
    end
end

class UsersController < ApplicationController

    get '/signup' do
        redirect_if_logged_in
        erb :'users/signup'
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :'users/show'
        
    end

    get '/users' do
        @users = User.all
        erb :'users/index'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect "/teams"
        else
            redirect "/signup"
        end
    end

    get '/logout' do
        logout
        redirect '/login'
    end

    get '/login' do
        redirect_if_logged_in
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect "/teams"    
        else
            redirect '/login'
        end
    end
        
end


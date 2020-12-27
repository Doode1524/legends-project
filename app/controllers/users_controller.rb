class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
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
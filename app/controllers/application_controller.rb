require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

# homepage
  get '/' do
    erb :index
  end

# log in the user or display an error message
  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

# renders the account view if they've logged in, the error view if not
  get '/account' do
    if session[:user_id]
      erb :account
    else
      erb :error
    end
  end

# log the user out and clear the session
  get '/logout' do
    session.clear
    redirect '/'
  end


end

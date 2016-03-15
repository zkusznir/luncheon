class SessionsController < ApplicationController

  def create
    if auth_hash
      user = User.create_with(name: auth_hash['info']['name']).find_or_create_by(uid: auth_hash['uid'])
      session[:id] = user.uid
      redirect_to root_path, notice: "Hi, #{user.name}!"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path, notice: 'Bye, bye!'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end

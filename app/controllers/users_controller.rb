class UsersController < ApplicationController
  expose(:users){ User.all }
  expose(:user)
  expose(:auths){ user.auths }
  expose(:user_providers){ auths.group_by(:provider).map(&:first) }
  
  before_filter :auth_require, only: %w[new create]
  before_filter :self_require, only: %w[edit update destroy]

  def show
  end

  def new
    user.account_id = current.auth.screen_name
    user.name       = current.auth.name
    user.auths << current.auth
    render action: 'form'
  end

  def create
    current.auth.user = user
    current.auth.save
    if user.save
      redirect_to action: 'show'
    else
      render action: 'form'
    end
  end

  def update
    if user.save
      redirect_to action: 'show'
    else
      render action: 'form'
    end
  end

  def destroy
    user.destroy
    redirect_to root
  end
  
  private
  def self?
    login? && current.user.id == params[:id] rescue nil
  end
end


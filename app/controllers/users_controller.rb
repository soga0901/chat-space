class UsersController < ApplicationController

  def search
    @users = User.where('name LIKE(?)', "%#{user}%")

    respond_to do |format|
      format.json { render 'index', handlers: 'jbuilder' }
    end

  end

end

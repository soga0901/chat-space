class UsersController < ApplicationController

  def search
    @users = User.where('name LIKE(?)', "%#{params[:user]}%").where.not(id: current_user.id)

    respond_to do |format|
      format.json { render 'search', handlers: 'jbuilder' }
    end
  end
end

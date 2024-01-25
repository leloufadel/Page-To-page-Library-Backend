class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :verify]
end

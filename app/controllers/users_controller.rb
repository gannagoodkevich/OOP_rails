class UsersController < ApplicationController
  skip_before_action :authenticate!
end

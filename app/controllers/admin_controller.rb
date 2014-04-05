class AdminController < ApplicationController 
  before_filter :authenticate_user!
  before_filter :is_admin
  layout 'admin'
end

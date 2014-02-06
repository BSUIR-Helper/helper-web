class WelcomeController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index
  skip_before_filter :authenticate_user!, :only => :index
end

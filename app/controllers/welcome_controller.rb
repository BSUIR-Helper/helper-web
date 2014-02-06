class WelcomeController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index
end

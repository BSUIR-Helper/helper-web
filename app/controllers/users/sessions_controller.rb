class Users::SessionsController < Devise::SessionsController
  skip_after_action :verify_authorized
end

class Users::RegistrationsController < Devise::RegistrationsController
  skip_after_action :verify_authorized
end

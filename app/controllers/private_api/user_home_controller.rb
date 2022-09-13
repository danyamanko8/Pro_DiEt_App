module PrivateApi
  class UserHomeController < PrivateApiController
    include Pundit
    skip_after_action :verify_authorized, only: [:homepage]
    def homepage
    end
  end
end

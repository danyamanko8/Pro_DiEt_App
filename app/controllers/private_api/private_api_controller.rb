class PrivateApiController < ApplicationController
  include Authorization
  before_action :authenticate_user!
  after_action :verify_authorized
end

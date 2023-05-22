module Admin
  class BaseController < ApplicationController
    http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], 
                               password: ENV["HTTP_BASIC_PASSWORD"],
                               if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }

  end
end
module Admin
  class ApplicationController < ApplicationController
    layout 'admin/application'

    before_action :authenticate!
  end
end

class ApiController < ApplicationController
  def root
    versions = {
    }
    render json: { versions: versions }
  end
end

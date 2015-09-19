class ApiController < ApplicationController
  def root
    versions = {
      v1: v1_root_url
    }
    render json: { versions: versions }
  end

  def v1
  end
end

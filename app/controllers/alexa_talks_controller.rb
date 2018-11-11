class AlexaTalksController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    request = AlexaRubykit::build_request(params)
    response = AlexaRubykit::Response.new
    response.add_speech("あなたの名前はゆうきですね")
    render json: response.build_response
  end
end
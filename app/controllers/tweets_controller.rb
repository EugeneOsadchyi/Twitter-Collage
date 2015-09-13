class TweetsController < ApplicationController
  def index
  end

  def load
    @tweets = $twitter_client.user_timeline(params[:name])

    respond_to do |format|
      format.js
    end
  end
end

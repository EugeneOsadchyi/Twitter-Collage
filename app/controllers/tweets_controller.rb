class TweetsController < ApplicationController
  def index
  end

  def load
    @tweets = $twitter_client.user_timeline(params[:name], { count: 3200, contributor_details: true })

    respond_to do |format|
      format.js
    end
  end
end

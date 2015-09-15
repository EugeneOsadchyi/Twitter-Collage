class TweetsController < ApplicationController
  include TweetsHelper

  def index
  end

  def load_tweets
    @tweets = $twitter_client.user_timeline(params[:name], { count: 3200, contributor_details: true })

    respond_to do |format|
      format.json { render json: @tweets }
      format.js
    end
  end

  def load_collage
    build_image(params[:name], cols: params[:cols], rows: params[:rows])

    send_file("#{Settings.output_file.path}#{Settings.output_file.name}#{Settings.output_file.format}")
  end

  def tweets_params
    params.permit(:name)
  end
end

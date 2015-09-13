class TweetsController < ApplicationController
  def index
  end

  def load
    respond_to do |format|
      format.js
    end
  end
end

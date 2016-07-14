class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render "new"
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweets_params)
    redirect_to tweets_path
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
  
  def tweets_params
    params.require(:tweet).permit(:content)
  end
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end

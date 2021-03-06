class TipsController < ApplicationController
  def index
    foursquare = FoursquareService.new
    @results = JSON.parse(resp.body)["response"]["list"]["listItems"]["items"]
  end

  def create
    foursquare = FoursquareService.new
    resp = foursquare.create_tip(session[:token], params[:venue_id] params[:tip])
    redirect_to tips_path
  end
end

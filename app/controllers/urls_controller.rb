require 'uri'
require "redis"

class UrlsController < ApplicationController

  def new
    @skinny_url = SkinnyUrl.new
  end

  def create
    args = {}
    args["url"] = params[:orig_url]
    @skinny_url = SkinnyUrl.new(args)

    if (@skinny_url.save)
      flash[:shortened_id] = @skinny_url.id
      redirect_to new_url_url
    else
      render :action => "new"
    end
  end

  def show
    @skinny_url = SkinnyUrl.find(params[:id])
    @skinny_url.count += 1
    @skinny_url.save
    redirect_to @skinny_url.orig_url
  end

end

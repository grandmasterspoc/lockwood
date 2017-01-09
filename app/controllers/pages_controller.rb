class PagesController < ApplicationController
  def home
    @tags = Tag.all.map { |t| t.name }.uniq
    @blogs = Blog.includes(:tags).all.order('created_at DESC')

  end

  def about
  end

  def contact
  end

  def dashboard
    @blogs = Blog.all || ["No Blogs Created Yet"]
    @blog_count = Blog.count || 0
    @ingredients_count = 178
    @suppliments_count = 23
    @clients = Client.all || ["No Clients Yet"]
  end  

  def landing
    @tags = Tag.all.map { |t| t.name }.uniq
    @blogs = Blog.includes(:tags).all.order('created_at DESC')
    @photo_1 = SiteStyle.where(style_type: :background_photo_1).last.photo.url
    @photo_2 = SiteStyle.where(style_type: :background_photo_2).last.photo.url
    # @photo_3 = SiteStyle.where(style_type: :background_photo_3).last.photo.url
    @logo = SiteStyle.where(style_type: :logo_photo).last.photo.url
  end  
end

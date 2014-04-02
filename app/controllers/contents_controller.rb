class ContentsController < ApplicationController

  def show
    @content = Content.find(params[:id])
    @topic = @content.topic
  end  
end

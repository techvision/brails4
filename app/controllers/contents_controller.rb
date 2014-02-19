class ContentsController < ApplicationController

  def show
    @content = Content.find(params[:id])
  end

  def download_mp3
    content = Content.find(params[:id])


    send_file  upload.content.path,
    :filename => upload.audio_mp3_file_name,
                :type => upload.audio_mp3_content_type,
    :disposition => 'attachment'
    flash[:notice] = "Your file has been downloaded"

  end

  def download_ogg
  end
end

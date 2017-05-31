class MediaDownloadsController < ApplicationController
  def index
    @media_downloads = MediaDownload.order(:description)
  end
end

class MediaDownloadsController < ApplicationController
  def index
    @media_downloads = MediaDownload.available.order(:file_filename)
  end
end

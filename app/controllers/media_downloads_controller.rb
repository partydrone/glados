class MediaDownloadsController < ApplicationController
  def index
    @media_downloads = MediaDownload.order(:file_filename)
  end
end

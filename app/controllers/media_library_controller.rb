class MediaLibraryController < ApplicationController

    def index
        @media_downloads = MediaDownload.limit(6)
    end

end
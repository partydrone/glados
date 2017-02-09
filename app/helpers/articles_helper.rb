module ArticlesHelper
  def embed_youtube_videos_for(body)
    body.gsub(/https?:\/\/youtu.be\/([^\s<]+)/, '<div class="flex-video widescreen"><iframe src="https://www.youtube.com/embed/\1?rel=0&showinfo=0" width="720" hieght="480" frameborder="0" allowfullscreen></iframe></div>')
  end
end

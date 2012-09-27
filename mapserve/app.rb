require "rubygems"
require "sinatra"



require "rack/cache"


# Cache for 3 hours
# ===============================
# set :static_cache_control, [:public, :max_age => 3600]

# Simple routes
# ==================

get "/maps/:zoom/:lat/:long.png" do
  content_type 'image/png'
  file = File.join('maps',params[:zoom], params[:lat], "#{params[:long]}.png")
	if File.exist?(file)		
		File.read( file)
	else
		File.read(File.join('maps', '404.png'))
	end
end

get "/" do
	File.read(File.join('maps', 'index.html'))
end
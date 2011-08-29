class Application
  def call(env)
    request = Rack::Request.new(env)
    
    unless request.host.start_with?("www.")
      [301, {"Content-Type" => "text/html", "Location" => request.url.sub("//", "//www.")}, []]
    end
  end
end
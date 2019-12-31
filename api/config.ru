require "sinatra/base"

class HelloApp < Sinatra::Application
  get "/" do
    if params[:weak_etag] == 'true'
      response.headers['Etag'] = 'W/d41d8cd98f00b204e9800998ecf8427e'
    else
      response.headers['Etag'] = 'd41d8cd98f00b204e9800998ecf8427e'
    end

    content_type :json
    { message: "hello!" }.to_json
  end
end

# When enabling Rack::Deflater, compression is done in rack layer, not nginx.
use Rack::Deflater

run HelloApp

require "sinatra/base"

class HelloApp < Sinatra::Application
  get "/" do
    content_type :json
    response.headers['Etag'] = 'd41d8cd98f00b204e9800998ecf8427e'
    { message: "hello!" }.to_json
  end
end

run HelloApp

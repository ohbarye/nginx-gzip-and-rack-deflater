require "sinatra/base"

class HelloApp < Sinatra::Application
  get "/hello" do
    content_type :json
    return { message: "hello" }.to_json
  end
end

run HelloApp

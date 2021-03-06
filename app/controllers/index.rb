require 'sinatra/cross_origin'
require 'json'
require 'net/http'

before do   
   enable :cross_origin
end


get '/' do
	@pipe1 = Pipe.find(1)
	@pipe2 = Pipe.find(2)

	pipes = [@pipe1, @pipe2] 
	data = Hash.new

	pipes.each do |pipe|
		data[pipe.id] = pipe.to_hash
	end

	if request.xhr?
		puts data.to_json
    data.to_json
  else
    erb :index
  end
end

post '/pipes/:id' do |id|
	pipe = Pipe.find(id)

	pipe.update(a: params["A"],b: params["B"], c:params["c"],)

	# if params["A"] > _
	# 	pipe.break
	# end

end

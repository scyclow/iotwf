# before do   
#    headers 'Access-Control-Allow-Origin' => '*', 
#            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
# end

require 'json'

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


# post '/'

before do   
   headers 'Access-Control-Allow-Origin' => '*', 
           'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
end

get '/' do
	@pipe1 = Pipe.find(1)
	@pipe2 = Pipe.find(2)

	pipes = [@pipe1, @pipe2] 
	data = Hash.new

	pipes.each do |pipe|
		data[pipe.id] = pipe.to_hash
	end

	respond_to do |format|
    format.json { data.to_json }
    format.html { erb :index }
  end
end


# post '/'

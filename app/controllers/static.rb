get '/' do
  erb :"static/index"
end

post '/urls' do
	new_url = Url.new
	new_url.link = params[:long_url].to_s
	new_url.serial_code = new_url.shorten
	new_url.save
	redirect '/'
end

get '/:serial_code' do
	long_url = 'http://' + Url.find_by(serial_code: params[:serial_code]).link
	redirect long_url
end
get '/' do
  erb :"static/index"
end

post '/urls' do
	new_url = Url.new
	new_url.link = params[:long_url].to_s
	new_url.serial_code = new_url.shorten
	new_url.click_count = 0
	new_url.save
	@error_messages = new_url.errors
	erb :'static/index'
end

get '/:serial_code' do
	url_record = Url.find_by(serial_code: params[:serial_code])
	url_record.increment!(:click_count)
	long_url = url_record.link
	redirect long_url
end
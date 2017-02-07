class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	def shorten
		# generate random code
		characters = [('a'..'z').to_a, ('A'..'Z').to_a, (0..9).to_a].flatten
		serial_code = characters.sample(7)
		serial_code = serial_code.join('')
		serial_code
	end
end

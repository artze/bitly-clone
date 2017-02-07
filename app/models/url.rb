class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :link, presence:{message: 'URL required'}
	validate :check_uri_validity
	def check_uri_validity
		if URI.parse(self.link).host.nil?
			errors.add(:link, 'Invalid URL entered')
		end
	end
	def shorten
		characters = [('a'..'z').to_a, ('A'..'Z').to_a, (0..9).to_a].flatten
		serial_code = characters.sample(7)
		serial_code = serial_code.join('')
		serial_code
	end
end

require 'sinatra'

class Retailer < Struct.new(:id, :name, :touch_icon_url)
	def self.find(id)
		RETAILERS.find{|r|r.id == id}
	end
end

RETAILERS = [
	Retailer.new(0, "Marks and Spencer", "http://asset1.marksandspencer.com/is/image/mands/logo-mns?$CHECKOUT_LOGO$"),
	Retailer.new(1, "Waitrose", "https://pbs.twimg.com/profile_images/463627280980254720/RvbRvneq.jpeg"),
	Retailer.new(2, "Sainburys", "http://shakefox.com/images2.moneysavingexpert.com/images/deals/tag-images/sainsburys_logo_d.gif")
]

get '/' do
	@retailers = RETAILERS
	erb :index
end

get '/retailers/:id' do
	@retailer = Retailer.find(params['id'].to_i)
	erb :retailer
end

require 'sinatra'
require 'mandrill' 

get '/' do
	
erb :index
	
end

post '/email' do
email = params["email"]
sender = params["name"]
phone = params['phone']
email_body = params["comment"]
m = Mandrill::API.new
message = {  
		 :subject=> "New comment from #{sender}",  
		 :from_name=> sender,  
		 :text=>email_body,  
		 :to=>[  
		   {  
		     :email=> "aps454@nyu.edu",  
		     :name=> "Arunabh"  
		   }  
		 ],  
		 :html=>"<html><h1>#{email_body}</h1><h3>#{phone}</h3></html>",  
		 :from_email=>email 
	}  
	sending = m.messages.send message  
	puts sending
	redirect to('/thanks')
end

get '/thanks' do
	erb :thanks
end
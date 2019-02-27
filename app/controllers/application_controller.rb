require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end
    
    post "/teams" do
      
      @team = Team.new(params[:team])
     
      params[:team][:members].each do |details|
        Member.new(details)
      end
     
      @member = Member.all
      
      @member_name_1 = @member[0].name
      @member_type_1 = @ship[0].type
      @ship_booty_1 = @ship[0].booty
      @ship_name_2 = @ship[1].name
      @ship_type_2 = @ship[1].type
      @ship_booty_2 = @ship[1].booty
      
      erb :team
    end
end

require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end
    
    post "/teams" do
      
      @team = Team.new(params[:team])
      
      @team_name = @team[0].name
      @team_motto = @team[0].motto
     
      params[:team][:members].each do |details|
        Member.new(details)
      end
     
      @member = Member.all
      
      @member_name_1 = @member[0].name
      @member_power_1 = @member[0].power
      @member_bio_1 = @member[0].biography
      @member_name_2 = @member[1].name
      @member_power_2 = @member[1].power
      @member_bio_2 = @member[1].biography
      @member_name_3 = @member[2].name
      @member_power_3 = @member[2].power
      @member_bio_3 = @member[2].biography
      
      erb :team
    end
end

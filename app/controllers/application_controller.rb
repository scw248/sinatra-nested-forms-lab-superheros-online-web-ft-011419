require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end
    
    post "/teams" do
      
      @team = Team.new(params[:team])
      binding.pry
      @team_name = @team.name
      @team_motto = @team.motto
     
      params[:team][:members].each do |details|
        Member.new(details)
      end
     
      @members = Members.all
      
      @member_name_1 = @members[0].name
      @member_power_1 = @members[0].power
      @member_bio_1 = @members[0].biography
      @member_name_2 = @members[1].name
      @member_power_2 = @members[1].power
      @member_bio_2 = @members[1].biography
      @member_name_3 = @members[2].name
      @member_power_3 = @members[2].power
      @member_bio_3 = @members[2].biography
      
      erb :team
    end
end

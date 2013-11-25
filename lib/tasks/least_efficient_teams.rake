namespace :least_efficient_teams do
  desc "Generates team names and salaries"
  task :seed => :environment do
  
  require 'nokogiri'
  require 'open-uri'
    
  n = Nokogiri::HTML(open("http://baseballplayersalaries.com/"))
  noko = -1
  team_name = n.css(".table_skinny")[9].css("td")[-1].text
    
  while team_name != ''
    noko += 1
    if noko % 2 == 0
      team_name = n.css(".table_skinny")[9].css("td")[noko].text
      puts team_name
    elsif noko % 2 == 1
      cost_per_win = n.css(".table_skinny")[9].css("td")[noko].text.gsub("$", "").gsub(",","").to_i
      puts cost_per_win
    end

    team = Team.find_by_name(team_name)
    team.update_attribute :cost_per_win, cost_per_win

    end
  end
end

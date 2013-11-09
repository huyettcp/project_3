namespace :add_cost_per_wins_to_team do
  desc "Generates efficiencies"
  task :seed => :environment do
  
  require 'nokogiri'
  require 'open-uri'
    
    puts "Adding efficiencies!"
    
    n = Nokogiri::HTML(open("http://baseballplayersalaries.com/"))
    noko = -1
    team_name = n.css(".table_skinny")[8].css("td")[-1].text
    
    while team_name != ''
      noko += 1
        if noko % 2 == 0
          team_name = n.css(".table_skinny")[8].css("td")[noko].text
            puts team_name
        elsif noko % 2 == 1
            cost_per_win = n.css(".table_skinny")[8].css("td")[noko].text.gsub("$", "").gsub(",","").to_i
            puts cost_per_win
        end

        team = Team.find_by_name(team_name)
        team.update_attribute :cost_per_win, cost_per_win

    end
  end
end

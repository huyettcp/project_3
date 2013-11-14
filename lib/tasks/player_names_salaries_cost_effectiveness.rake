namespace :player_names_salaries_cost_effectiveness do
  desc "Generates player data"
  task :seed => :environment do


  require 'nokogiri'
  require 'open-uri'



  n = Nokogiri::HTML(open("http://baseballplayersalaries.com/teams/24_Pittsburgh_Pirates"))
  noko = 0
  player_name = nil

  while player_name != ''
    player_name = n.css(".leftcol").css("tr").css("td").css("a")[noko].text
    player_salary = n.css(".leftcol").css("tr").css("td").css(".big")[noko].text.gsub("$", "").gsub(",","").to_i
    noko += 1
    puts player_name
    puts player_salary

    team_name = n.css("h2").text
    team_id = Team.find_by_name(team_name)
    player = Player.create(name: player_name, salary: player_salary, team_id: team_id.id)
  end
end

end





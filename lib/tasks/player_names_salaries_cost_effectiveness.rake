namespace :player_names_salaries_cost_effectiveness do
  desc "Generates player data"
  task :seed => :environment do

  require 'nokogiri'
  require 'open-uri'

  Player.destroy_all

  n = Nokogiri::HTML(open("http://baseballplayersalaries.com/teams/1_Boston_Red_Sox"))
  noko = 0
  player_name = nil

  while player_name != ''
    player_name = n.css(".leftcol").css("tr").css("td").css("a")[noko].text
    player_salary = n.css(".leftcol").css("tr").css("td").css(".big")[noko].text.gsub("$", "").gsub(",","").to_i
    noko += 1
    puts player_name
    puts player_salary
    player = Player.create(name: player_name, salary: player_salary)
  end
end

end





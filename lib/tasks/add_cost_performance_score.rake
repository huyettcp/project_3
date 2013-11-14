namespace :add_cost_performance_score do
  desc "Generates cost performance score for players"
  task :seed => :environment do
  
  require 'nokogiri'
  require 'open-uri'

  n = Nokogiri::HTML(open("http://baseballplayersalaries.com/teams/9_Kansas_City_Royals"))
  noko = 0
  player_name = nil

  while player_name != ''
    player_name = n.css(".rightcol").css("tr").css("td").css("a")[noko].text
    cost_performance_score = n.css(".rightcol").css("tr").css("td").css(".extrabig")[noko].text.gsub("$", "").gsub(",","").to_f
    noko += 1
    puts player_name
    puts cost_performance_score

    player = Player.find_by_name(player_name)
    player.update_attribute :cost_performance_score, cost_performance_score
  end
end
end

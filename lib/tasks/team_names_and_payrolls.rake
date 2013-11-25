namespace :team_names_and_payrolls do
  desc "Generates team names and salaries"
  task :seed => :environment do
  
  require 'nokogiri'
  require 'open-uri'

  Team.destroy_all
    
  n = Nokogiri::HTML(open("http://baseballplayersalaries.com/"))
  noko = -1
  team_name = n.css(".table_skinny")[7].css("td")[-1].text
    
  while team_name != ''
    noko += 1
    if noko % 2 == 0
      team_name = n.css(".table_skinny")[7].css("td")[noko].text
      puts team_name
    elsif noko % 2 == 1
      team_payroll = n.css(".table_skinny")[7].css("td")[noko].text.gsub("$", "").gsub(",","").to_i
      puts team_payroll
    end
    team = Team.create(name: team_name, payroll: team_payroll)
    end
  end
end



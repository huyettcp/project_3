# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ## Worst value
# n.css(".table_skinny")[2].text

# ## Best value
# n.css(".table_skinny")[1].text

# ## Cheapest home runs
# n.css(".table_skinny")[3].text

# ## Most expensive home runs
# n.css(".table_skinny")[4].text

# ## Returns "New York Yankees"
# n.css(".table_skinny")[7].css("td")[0].text


#########################################################

namespace :wordlist do
      desc "Generates team names and salaries"
      task :seed => :environment do

        require 'nokogiri'
        require 'open-uri'

        Team.destroy_all

        puts "sup bros!"

        n = Nokogiri::HTML(open("http://baseballplayersalaries.com/"))
        noko = -1
        team_name = n.css(".table_skinny")[8].css("td")[0].text

        while team_name != ''
          noko += 1
          if noko % 2 == 0
            team_name = n.css(".table_skinny")[8].css("td")[noko].text
            puts team_name
          elsif noko % 2 == 1
            team_payroll = n.css(".table_skinny")[8].css("td")[noko].text.gsub("$", "").gsub(",","").to_i
            puts team_payroll
          end

          team = Team.create(name: team_name, team_payroll: team_payroll)

        end
  end
end

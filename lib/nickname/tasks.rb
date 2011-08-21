require 'rake'
require 'nickname'

namespace :nicknames do
  desc "Populate Nickname table"
  task :populate => :environment do
    # Processes file in CSV format from http://code.google.com/p/nickname-and-diminutive-names-lookup/
    puts "Truncating nicknames table"
    Nickname.delete_all

    puts "Downloading nicknames CSV file from http://code.google.com/p/nickname-and-diminutive-names-lookup/"
    file = Net::HTTP.get 'nickname-and-diminutive-names-lookup.googlecode.com', '/files/names1.1.csv'
    puts "Done"

    puts "Parsing file"
    file.split("\n").in_groups_of(100, false) do |group|
      group.each do |line|
        names = line.chomp.split(',')
        diminutive = names[0]
        result = Nickname.create(:name => diminutive)
        result.update_attributes(:nickname_id => result.id)
        names[1..-1].each do |nickname|
          Nickname.create(:name => nickname, :nickname_id => result.id)
        end
      end
      puts "Processed #{Nickname.count} records"
    end
    puts "Finished processing #{Nickname.count} records"
  end
end

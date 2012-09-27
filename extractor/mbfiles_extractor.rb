require "rubygems"
require "sqlite3"

=begin
ported from python library
git://github.com/pbarry/MBTiles-extractor.git

=end


mbfile_name = "map/schenectady.mbtiles"
# Open a database
db = SQLite3::Database.new mbfile_name 


# Find a few rows
db.execute( "select * from tiles" ) do |row|
  puts "" + row[0].to_s + "," + row[1].to_s  + "," + row[2].to_s 
  #map
  directory = row[0].to_s
  subdirectory =  directory + "/" + row[1].to_s 
  #assuming only png for maps
  filename = subdirectory + "/" + row[2].to_s + ".png"
  Dir::mkdir(directory) unless File.exists?(directory)
  Dir::mkdir(subdirectory) unless File.exists?(subdirectory)
  File.open(filename, 'w') { |file| file.write(row[3]) }
end
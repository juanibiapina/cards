require "rubygems"
require "bundler"

Bundler.require

data = Squib.csv file: "data/prototype.csv"

data["name"].map do |name|
  filename = "tmp/#{name}.png"
  Identicon.file_for(name, filename, 675, [255, 255, 255])
end

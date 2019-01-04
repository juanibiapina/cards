require "rubygems"
require "bundler"

Bundler.require

data = Squib.csv file: "input/prototype-2.csv"

Squib::Deck.new cards: data["type"].size, layout: "layout.yml", width: 825, height: 1125, dpi: 300 do
  background color: "white"

  rect layout: "cut" # cut line as defined by TheGameCrafter
  rect layout: "safe" # safe zone as defined by TheGameCrafter

  text str: data["type"].map {|i| i.capitalize }, layout: "type"
  text str: data["power"], layout: "type_right"
  text str: data["description"], layout: "description"

  save_png
end

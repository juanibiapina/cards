require "rubygems"
require "bundler"

Bundler.require

data = Squib.csv file: "data/prototype-2.csv"

Squib::Deck.new cards: data["type"].size, layout: "layouts/layout.yml", width: 825, height: 1125, dpi: 300 do
  background color: "white"

  rect layout: "cut" # cut line as defined by TheGameCrafter
  rect layout: "safe" # safe zone as defined by TheGameCrafter

  text str: data["type"].map(&:capitalize), layout: "type"
  text str: data["power"], layout: "type_right"
  text str: data["description"], layout: "description"

  build :cards do
    save_png trim: "0.125in",
             dir: "output/cards"
  end

  build :print_and_play do
    save_sheet prefix: "pnp_sheet_",
               trim: "0.125in",
               rows: 3,
               columns: 3,
               dir: "output/sheets"
  end
end

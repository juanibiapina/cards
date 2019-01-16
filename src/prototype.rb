require "rubygems"
require "bundler"

Bundler.require

data = Squib.csv file: "data/prototype.csv"

Squib::Deck.new cards: data["type"].size, layout: "layouts/layout.yml", width: 825, height: 1125, dpi: 300 do
  background color: "white"
  hint text: :cyan if ENV["SQUIB_BUILD"] == "proof"

  text str: data["name"], layout: "name"
  text str: data["description"], layout: "description"
  png file: data["name"].map { |name| "tmp/#{name}.png" }, layout: "art"

  build :proof do
    safe_zone

    save_png dir: "output",
             trim: "0.125in",
             range: 0,
             prefix: "proof_"
  end

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

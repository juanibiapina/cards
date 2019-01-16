require "rubygems"
require "bundler"

Bundler.require

data = Squib.csv file: "data/prototype.csv"

TOTAL_WIDTH = 825
TOTAL_HEIGHT = 1125
MARGIN = 75
CARD_WIDTH = TOTAL_WIDTH - (2 * MARGIN)
CARD_HEIGHT = TOTAL_HEIGHT - (2 * MARGIN)

SPACE = 10
LARGE_SPACE = 15

POWER_RADIUS = 50
POWERS_WIDTH = (2 * POWER_RADIUS)
NAME_HEIGHT = 50
ART_HEIGHT = 520
DESCRIPTION_HEIGHT = 275

Squib::Deck.new cards: data["type"].size, width: TOTAL_WIDTH, height: TOTAL_HEIGHT, dpi: 300 do
  background color: "white"
  hint text: :cyan if ENV["SQUIB_BUILD"] == "proof"

  # military power
  circle(
    x: MARGIN + POWER_RADIUS,
    y: MARGIN + POWER_RADIUS,
    radius: POWER_RADIUS,
  )

  # diplomatic power
  circle(
    x: MARGIN + POWER_RADIUS,
    y: MARGIN + (3 * POWER_RADIUS) + SPACE,
    radius: POWER_RADIUS,
  )

  # trade power
  circle(
    x: MARGIN + POWER_RADIUS,
    y: MARGIN + (5 * POWER_RADIUS) + (2 * SPACE),
    radius: POWER_RADIUS,
  )

  # name
  text(
    str: data["name"],
    x: MARGIN + POWERS_WIDTH + SPACE,
    y: MARGIN + SPACE,
    width: CARD_WIDTH - POWERS_WIDTH - SPACE - SPACE,
    height: NAME_HEIGHT,
    font_size: 50,
  )

  # art
  png(
    file: data["name"].map { |name| "tmp/#{name}.png" },
    x: MARGIN + POWERS_WIDTH + SPACE,
    y: MARGIN + SPACE + NAME_HEIGHT + SPACE,
    width: CARD_WIDTH - POWERS_WIDTH - SPACE - SPACE,
    height: ART_HEIGHT,
  )

  # description
  text(
    str: data["description"],
    x: MARGIN,
    y: MARGIN + SPACE + NAME_HEIGHT + SPACE + ART_HEIGHT + SPACE,
    width: CARD_WIDTH,
    height: DESCRIPTION_HEIGHT,
    valign: "middle",
    align: "center",
    font_size: 50,
  )

  # trade cost
  circle(
    x: MARGIN + CARD_WIDTH - POWER_RADIUS,
    y: MARGIN + CARD_HEIGHT - POWER_RADIUS,
    radius: POWER_RADIUS,
  )

  # diplomatic cost
  circle(
    x: MARGIN + CARD_WIDTH - (3 * POWER_RADIUS) - SPACE,
    y: MARGIN + CARD_HEIGHT - POWER_RADIUS,
    radius: POWER_RADIUS,
  )

  # military cost
  circle(
    x: MARGIN + CARD_WIDTH - (5 * POWER_RADIUS) - (2 * SPACE),
    y: MARGIN + CARD_HEIGHT - POWER_RADIUS,
    radius: POWER_RADIUS,
  )

  # victory points
  rect(
    x: MARGIN - 10,
    y: MARGIN + SPACE + NAME_HEIGHT + SPACE + ART_HEIGHT + SPACE + DESCRIPTION_HEIGHT - 10,
    width: 100 + (2 * 10),
    height: 100 + (2 * 10),
  )

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

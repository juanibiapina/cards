require "rubygems"
require "bundler"

Bundler.require

Squib::Deck.new width: 825, height: 1125, cards: 2 do
  background color: 'pink'
  rect
  text str: ['Hello', 'World!']
  save_png prefix: 'hello_'
end

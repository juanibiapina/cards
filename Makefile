all: images proof pnp cards

images:
	bundle exec ruby src/images.rb

proof:
	SQUIB_BUILD=proof bundle exec ruby src/prototype.rb

pnp:
	SQUIB_BUILD=print_and_play bundle exec ruby src/prototype.rb

cards:
	SQUIB_BUILD=cards bundle exec ruby src/prototype.rb

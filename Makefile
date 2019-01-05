all: prototype-2-proof prototype-2-pnp prototype-2-cards

prototype-2-proof:
	SQUIB_BUILD=proof bundle exec ruby src/prototype-2.rb

prototype-2-pnp:
	SQUIB_BUILD=print_and_play bundle exec ruby src/prototype-2.rb

prototype-2-cards:
	SQUIB_BUILD=cards bundle exec ruby src/prototype-2.rb

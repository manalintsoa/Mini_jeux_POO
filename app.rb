require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "\n Voici l'etat de nos joueurs : "
 	"#{player1.show_state}"
	"#{player2.show_state}"

while player1.life_points > 0 and player2.life_points > 0
	
	puts "\n Passons à la phase d'attaque :"
	if player1.life_points <= 0 
		break
	else
		"#{player1.attacks(player2)}"
	end
	
	if player1.life_points <= 0
		break
	else
		"#{player2.attacks(player1)}"
	end
	if player1.life_points > 0 and player2.life_points > 0
		puts "\n Voici l'etat de nos joueurs : "
	 	"#{player1.show_state}"
		"#{player2.show_state}"
	end
end

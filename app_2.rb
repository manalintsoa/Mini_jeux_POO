require 'bundler'
Bundler.require


require_relative 'lib/game'
require_relative 'lib/player'

puts " ------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO	       |"
puts "|Le but de jeu est d''être le derniersurvivant ! |"
puts "--------------------------------------------------"

user = HumanPlayer.new("Aina")
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]


puts "Voici l'etat de l'HumanPlayer : "
"#{user.show_state}"
puts "\n Quelle action veux-tu effectuer?"
puts"a - chercher une meilleur arme "
puts"s - chercher à se soigner "
puts"\n attaquer unn joueur en vue :"
	"0 - #{player1.show_state}"
	"1 - #{player2.show_state}"

while user.life_points > 0 && player1.life_points > 0 ||user.life_points < 0 && player1.life_points > 0 || user.life_points > 0 && player1.life_points < 0 || player2.life_points > 0
		puts "\n\n Pour jouer, tapez 1 ou 0 :"

		a = gets.chomp
		if  a == "a"
			puts "#{user.search_weapon}"

			elsif a == "s"
				puts "#{user.search_health_pack}"

			elsif a.to_i == 0
				puts "####### COMBAT #######"
				puts "#{user.attacks(player1)}"

				if player1.life_points <= 0
					puts "OEEE, #{player1.name.upcase} EST MORT, Appuyer 1 pour combattre avec #{player2.name}"
				end

			elsif a.to_i == 1
				puts "####### COMBAT ####### "
				puts "#{user.attacks(player2)}"

				if player2.life_points <= 0
					puts "OEEEE, #{player2.name.upcase} EST  MORT, Appuyer 0 pour combattre avec #{player1.name}"
				end
			if player1.life_points <= 0 && player2.life_points <= 0
				puts "JE"
			end
		end	

	puts "\n\nLES ENNEMIE M'ATTAQUES  : \n"
	
	if user.life_points > 0

		if player1.life_points > 0
			puts "#{player1.attacks(user)}"	
			elsif 
			puts "#{player1.name.upcase} est  mort "
			puts "Je suis encore vivre , OEEEE"
			
		end

		if player2.life_points > 0
			puts "#{player2.attacks(user)}"	
			elsif 
			puts " #{player2.name.upcase} est  mort"
			puts "Je suis encore vivre , OEEEE"
		end
end

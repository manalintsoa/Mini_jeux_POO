class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{@life_points} point de vie "
	end

	def gets_damage(nombre)
		@life_points = @life_points - nombre
		@life_points = 0 if @life_points <= 0
		puts "#{name} a encore #{@life_points} point de vie"
		if @life_points <= 0
			puts "le joueur #{name} a été tué"

		else
			#puts "Le jeu continue"
		end
	end

	def attacks(player)
		compt_damage = player.compute_damage
		puts "#{name} attaque #{player.name}"
		puts "il lui infige #{compt_damage} points de dommages"
		rest_point = player.gets_damage(compt_damage)
	end

	def compute_damage
		return rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level, :name, :life_points
	
	def initialize(name)
		@weapon_level = 1
		@name = name
		@life_points = 100
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6)*@weapon_level
	end

	def search_weapon
		level_arm = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{level_arm}"
		if level_arm > @weapon_level
			@weapon_level = level_arm
			puts "Youhou! elle est meilleur que ton arme  actuelle : tu la prend"
		else
			puts "M@*#$ ... elle n'est pas mieux que ton arme actuelle ..."
		end
	end

	def search_health_pack
		dice = rand(1..6)
		if dice == 1
			puts "Tu n'as rien trouvé ..."
			puts "Tu n'as rien trouvé ..."
		elsif dice == 2 || dice == 3 || dice == 4 || dice == 5
 			puts "Bravo , tu as trouvé u pack de +50 points de vie !"
			add_life_point(50)
		else
			puts "Waow , tu as trouvé un pack de +80 points de vie!"
			add_life_point(80)
		end
	end

	def add_life_point(point)
		@life_points = @life_points + point
		@life_points = 100 if @life_points > 100
	end
end

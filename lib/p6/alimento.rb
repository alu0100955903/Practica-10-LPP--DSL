class Alimento

	include Comparable

	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno

	def initialize (nombre, proteinas, carbohidratos, lipidos, gei, terreno)
		@nombre, @proteinas, @carbohidratos, @lipidos, @gei, @terreno = nombre, proteinas, carbohidratos, lipidos, gei, terreno
	end

	#Metodo que devuelve el nombre del alimento
	def d_nombre
		return @nombre
	end

	#Metodo que devuelve las proteinas del alimento
	def d_proteina
		return @proteinas
	end

	#Metodo que devuelve los carbohidratos del alimento
	def d_carbohidratos
		return @carbohidratos
	end

	#Metodo que devuelve los lipidos del alimento
	def d_lipidos
		return @lipidos
	end

	#Metodo que devuelve los gases del alimento
	def d_gei
		return @gei
	end

	#Metodo que devuelve el terreno del alimento
	def d_terreno
		return @terreno
	end

	#Metodo que devuelve la ingesta de referencia energetica
	def irenergia
		@irenergia=(@lipidos*9)+(@proteinas*4)+(@carbohidratos*4)
		return @irenergia
	end

	#Metodo comparable
	def <=> (other)
		irenergia <=> other.irenergia
	end
end

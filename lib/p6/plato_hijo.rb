class Plato_hijo < Plato

	include Comparable

	def <=> (other)
		huella_nutricional <=> other.huella_nutricional
	end

	#Metodo que calcula los gases del plato
	def calc_gases
		gei = @alimentos.gases
		return gei
	end

	#Metodo que calcula los terrenos del plato
	def calc_terreno
		ter = @alimentos.tierras
		return ter
	end
	
	#Metodo que calcula la energia que aporta el plato
	def eficiencia
		efi = @alimentos.get_energia
		return efi
	end

	#Metodo que calcula el indice de huella nutricional del plato
	def huella_nutricional
		@huella_energia
		if @alimentos.get_energia <=670
			@huella_energia=1.0
		elsif @alimentos.get_energia>670 and @alimentos.get_energia<=830
		        @huella_energia=2.0
		else
		        @huella_energia=3.0
		end

		@huella_carbono
		if @alimentos.gases <=800
			@huella_carbono=1.0
		elsif @alimentos.gases>800 and @alimentos.gases<=1200
		        @huella_carbono=2.0
		else
		        @huella_carbono=3.0
		end
		
		return (@huella_carbono+@huella_energia)/2
	end
end

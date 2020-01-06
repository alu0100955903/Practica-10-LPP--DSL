require 'p6/alimento.rb'
require 'p6/lista.rb'
require 'p6/plato.rb'
require 'p6/plato_hijo.rb'

RSpec.describe Plato do
                before :each do
                        #Alimento dieta espanola
                        @a1 = Alimento.new("sopa" ,20,40,40,24,20)
                        @a2 = Alimento.new("carne",15,35,50,31,37)
                        @a3 = Alimento.new("yogur",25,45,30,56,12)

                        #Alimento dietra vvasca
                        @a4 = Alimento.new("potaje"  ,20,65,15,65,42)
                        @a5 = Alimento.new("pescado" ,15,60,25,34,81)
                        @a6 = Alimento.new("natillas",10,55,35,13,63)

                        #Alimento dieta vegetaria
                        @a7 = Alimento.new("gazpacho",20,40,40,34,10)
                        @a8 = Alimento.new("huevos"  ,15,35,50,32,29)
                        @a9 = Alimento.new("batido"  ,25,45,30,21,14)

                        #Alimento dieta vegetaliana
                        @a10= Alimento.new("potaje"  ,15,35,50,12,31)
                        @a11= Alimento.new("ensalada",20,40,40,32,15)
                        @a12= Alimento.new("fruta"   ,25,45,30,21,20)

                        #Alimento dieta animal
                        @a13= Alimento.new("cocido",30,30,40,54,52)
                        @a14= Alimento.new("filete",30,20,50,65,77)
                        @a15= Alimento.new("batido",30,60,20,21,61)

                        #Dietas
                        @dieta_espanola    = List.new(nil,nil)
                        @dieta_vasca       = List.new(nil,nil)
                        @dieta_vegetaria   = List.new(nil,nil)
                        @dieta_vegetaliana = List.new(nil,nil)
                        @dieta_animal      = List.new(nil,nil)

                        @dieta_espanola.insertar_por_cola(@a1)
                        @dieta_espanola.insertar_por_cola(@a2)
                        @dieta_espanola.insertar_por_cola(@a3)

                        @dieta_vasca.insertar_por_cola(@a4)
                        @dieta_vasca.insertar_por_cola(@a5)
                        @dieta_vasca.insertar_por_cola(@a6)

                        @dieta_vegetaria.insertar_por_cola(@a7)
                        @dieta_vegetaria.insertar_por_cola(@a8)
                        @dieta_vegetaria.insertar_por_cola(@a9)

                        @dieta_vegetaliana.insertar_por_cola(@a10)
                        @dieta_vegetaliana.insertar_por_cola(@a11)
                        @dieta_vegetaliana.insertar_por_cola(@a12)

                        @dieta_animal.insertar_por_cola(@a13)
                        @dieta_animal.insertar_por_cola(@a14)
                        @dieta_animal.insertar_por_cola(@a15)

			#lista de cantidades
                        @cantidad_espanola    = List.new(nil,nil)
                        @cantidad_vasca       = List.new(nil,nil)
                        @cantidad_vegetaria   = List.new(nil,nil)
                        @cantidad_vegetaliana = List.new(nil,nil)
                        @cantidad_animal      = List.new(nil,nil)

                        @cantidad_espanola.insertar_por_cola(25)
                        @cantidad_espanola.insertar_por_cola(25)
                        @cantidad_espanola.insertar_por_cola(25)

                        @cantidad_vasca.insertar_por_cola(20)
                        @cantidad_vasca.insertar_por_cola(20)
                        @cantidad_vasca.insertar_por_cola(20)

                        @cantidad_vegetaria.insertar_por_cola(30)
                        @cantidad_vegetaria.insertar_por_cola(30)
                        @cantidad_vegetaria.insertar_por_cola(30)

                        @cantidad_vegetaliana.insertar_por_cola(40)
                        @cantidad_vegetaliana.insertar_por_cola(40)
                        @cantidad_vegetaliana.insertar_por_cola(40)

                        @cantidad_animal.insertar_por_cola(25)
                        @cantidad_animal.insertar_por_cola(25)
                        @cantidad_animal.insertar_por_cola(25)

			#Platos
                        @plato_espanol     = Plato.new("espanolito"   ,@dieta_espanola, @cantidad_espanola)
                        @plato_vasca       = Plato.new("vasquito"     ,@dieta_vasca, @cantidad_vasca)
                        @plato_vegetaria   = Plato.new("vegetariana"  ,@dieta_vegetaria, @cantidad_vegetaria)
                        @plato_vegetaliana = Plato.new("vegetalianita",@dieta_vegetaliana, @cantidad_vegetaliana)
                        @plato_animal      = Plato.new("animalito"    ,@dieta_animal, @cantidad_animal)
                
			#Plato_hijo
			@plato_hijo1 = Plato_hijo.new("espanolito" ,@dieta_espanola,@cantidad_espanola)
			@plato_hijo2 = Plato_hijo.new("vas1quito"  ,@dieta_vasca,@cantidad_vasca)
			@plato_hijo3 = Plato_hijo.new("vegetariana",@dieta_vegetaria,@cantidad_vegetaria)
		
			#lista de platos
			@lista_platos = List.new(nil,nil)

			@lista_platos.insertar_por_cola(@plato_hijo1)
			@lista_platos.insertar_por_cola(@plato_hijo2)
			@lista_platos.insertar_por_cola(@plato_hijo3)
		end

                describe "Prueba Plato" do

                          it "Plato tiene Nombre" do
				  expect(@plato_espanol.nombre).to eq ("espanolito")
                          end

			  it "Plato tiene alimentos" do
				  expect(@plato_espanol.alimentos).to eq(@dieta_espanola)
			  end

			  it "Plato tiene cantidades" do
				  expect(@plato_espanol.cantidades).to eq(@cantidad_espanola)
			  end

			  it "Plato calcula porcentaje de proteinas" do
				  expect(@plato_espanol.por_proteinas).to eq(20)
			  end
			
			  it "Plato calcula porcentaje de lipidos" do
				  expect(@plato_espanol.por_lipidos).to eq(40)
			  end
			  
			  it "Plato calcula porcentaje de carbohidratos" do
				  expect(@plato_espanol.por_carbo).to eq(40)
			  end

                end

		describe "Pruebas de clase" do

			it "@plato pertenece a Plato" do
				expect(@plato_espanol.class).to eq(Plato)
			end

			it "@plato es una instancia de la clase Plato" do
				expect(@plato_espanol.instance_of? Plato).to eq(true)
			end

			it "@plato es un objeto de la clase Plato" do
				expect(@plato_espanol.is_a? Plato).to eq(true)
			end
		end

		describe "Pruebas comparable clase Plato_hijo" do
			it "Prueba < de plato hijo" do
				#expect(@plato_hijo2 < @plato_hijo1).to eq(false)
			end

			it "Prueba > de plato hijo" do
				#expect(@plato_hijo1 > @plato_hijo2).to eq(false)
			end

			it "Prueba <= de plato hijo" do
				#expect(@plato_hijo2 <= @plato_hijo1).to eq(true)
			end

			it "Prueba >= de plato hijo" do
				#expect(@plato_hijo1 >= @plato_hijo2).to eq(true)
			end

			it "Prueba == de plato hijo" do
				#expect(@plato_hijo1 == @plato_hijo2).to eq(true)
			end

			it "Prueba between de plato hijo" do
				#expect(@plato_hijo2.between?(@plato_hijo1,@plato_hijo3)).to eq(true)
			end

		end

		describe "Pruebas enumerable clase Plato_hijo" do
			it "Prueba min" do
				#expect(@lista_platos.min).to eq(@plato_hijo2)
			end
		
			it "Prueba max" do
				#expect(@lista_platos.max).to eq(@plato_hijo1)
			end
		
			it "Prueba sort" do
				#expect(@lista_platos.sort).to eq([@plato_hijo2,@plato_hijo3,@plato_hijo1])
			end
	
			it "Prueba select" do
				#expect(@lista_platos.select{|i| i.nombre == "espanolito"}).to eq([@plato_hijo1])
			end

			it "Prueba collect" do
				#expect(@lista_platos.collect{|i| @plato_hijo1}).to eq([@plato_hijo1,@plato_hijo1,@plato_hijo1])
			end
		end

		describe "Pruebas funciones clase Plato_hijo" do
			  it "Calcular emisiones de gases del plato_hijo" do
				  expect(@plato_hijo1.calc_gases).to eq(111)
			  end

			  it "Calcular gei del plato_hijo" do
				  expect(@plato_hijo1.calc_terreno).to eq(69)
			  end

			  it "Prueba calcular energia plato_hijo" do
				  expect(@plato_hijo1.eficiencia).to eq(1800)
			  end
		end


end

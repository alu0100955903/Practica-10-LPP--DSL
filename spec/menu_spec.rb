require 'p6/alimento.rb'
require 'p6/lista.rb'
require 'p6/plato.rb'
require 'p6/plato_hijo.rb'

RSpec.describe Plato do
        before :each do
                @a1 = Alimento.new("Potaje",1,1,1,1,1)
                @a2 = Alimento.new("Carne",1,1,1,1,1)
                @a3 = Alimento.new("Helado",1,1,1,1,1)

                @a4 = Alimento.new("Potaje",3,3,3,3,3)
                @a5 = Alimento.new("Carne",3,3,3,3,3)
                @a6 = Alimento.new("Helado",3,3,3,3,3)

                @a7 = Alimento.new("Potaje",20,40,40,34,10)
                @a8 = Alimento.new("Carne",15,35,50,32,29)
                @a9 = Alimento.new("Helado",25,45,30,21,14)

		#Primer plato
                @dieta = List.new(nil,nil)
                @dieta.insertar_por_cola(@a1)
                @dieta.insertar_por_cola(@a2)
                @dieta.insertar_por_cola(@a3)

                @cantidad = List.new(nil,nil)
                @cantidad.insertar_por_cola(0)
                @cantidad.insertar_por_cola(0)
                @cantidad.insertar_por_cola(0)

                @plato = Plato.new("plato1",@dieta,@cantidad)
                @plato_hijo1 = Plato_hijo.new("plato1",@dieta,@cantidad)

		#Segundo plato
                 @dieta2 = List.new(nil,nil)
                 @dieta2.insertar_por_cola(@a4)
                 @dieta2.insertar_por_cola(@a5)
                 @dieta.insertar_por_cola(@a6)

                 @cantidad2 = List.new(nil,nil)
                 @cantidad2.insertar_por_cola(25)
                 @cantidad2.insertar_por_cola(26)
                 @cantidad2.insertar_por_cola(27)

                 @plato2 = Plato.new("plato2",@dieta2,@cantidad2)
                 @plato_hijo2 = Plato_hijo.new("plato2",@dieta2,@cantidad2)

		 #Tercer plato
                  @dieta3 = List.new(nil,nil)
                  @dieta3.insertar_por_cola(@a7)
                  @dieta3.insertar_por_cola(@a8)
                  @dieta3.insertar_por_cola(@a9)

                  @cantidad3 = List.new(nil,nil)
                  @cantidad3.insertar_por_cola(25)
                  @cantidad3.insertar_por_cola(26)
                  @cantidad3.insertar_por_cola(27)

                  @plato3 = Plato.new("plato3",@dieta3,@cantidad3)
                  @plato_hijo3 = Plato_hijo.new("plato3",@dieta3,@cantidad3)

        end

        describe "Prueba Huella Nutricional" do
                it "Prueba funcion huella nutricional" do
			expect(@plato_hijo1.huella_nutricional).to eq(1.0)
                end
		
		it "Calcula plato con máxima huella" do
			
			array_menu=[]
			array_menu << @plato_hijo1
			array_menu << @plato_hijo2
			array_menu << @plato_hijo3

			expect(array_menu.max).to eq(@plato_hijo3)
		end
		
		it "Incrementa precio" do

			array_precio=[]
			array_precio << 15
			array_precio << 10
			array_precio << 20

			array_menu=[]
			array_menu << @plato_hijo1
			array_menu << @plato_hijo2
			array_menu << @plato_hijo3
			
			plato_max = array_menu.max
			proporcion = plato_max.huella_nutricional
			
			puts "Precios al principio"
			puts array_precio

			resultado = array_precio.map{ |x| x*proporcion}
			
			puts "Precios al final"
			puts resultado
			
			expect(resultado).to eq([30,20,40])
		end
        end
end

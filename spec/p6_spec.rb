require 'p6/alimento.rb'

RSpec.describe Alimento do
	before :each do
		@a1  = Alimento.new("pescado",30,41,100,7,8)
		@a2  = Alimento.new("yogur",4,39,100,7,8)
		@a3  = Alimento.new("sopa",20,76,40,1,1)

		@a4  = Alimento.new("carne",20,239,50,1,1)
		@a5  = Alimento.new("ensalada",6,39,20,1,1)
		@a6  = Alimento.new("potaje",15,76,10,1,1)
	end

	describe "Pruebas alimento" do

		it "Alimento tiene nombre" do
			expect(@a1.d_nombre).to eq("pescado")
		end

		it "Alimento tiene carbohidratos" do
			expect(@a1.d_carbohidratos).to eq(41)
		end

		it "Alimento tiene lipidos" do
			expect(@a1.d_lipidos).to eq(100)
		end

		it "Alimento tiene GEI" do
			expect(@a1.d_gei).to eq(7)
		end

		it "Alimento tiene terreno" do
			expect(@a1.d_terreno)==8
		end

		it "Ingesta de energia hombre" do
			expect(@a1.irenergia+@a2.irenergia+@a3.irenergia).to eq(3000)
		end

		it "Ingesta de energia mujer" do
			expect(@a4.irenergia+@a5.irenergia+@a6.irenergia).to eq(2300)
		end

		it "Ingesta de proteinas recomentada hombre" do
			expect(@a1.d_proteina+@a2.d_proteina+@a3.d_proteina).to eq(54)
		end
		
		it "Ingesta de proteinas recomendada mujer" do
			expect(@a4.d_proteina+@a5.d_proteina+@a6.d_proteina).to eq(41)
		end
	end
end

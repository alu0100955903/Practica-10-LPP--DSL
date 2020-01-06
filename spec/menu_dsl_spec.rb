require 'p6/MenuDsl.rb'

RSpec.describe MenuDsl do

	describe "Carga correctamente" do

		it "Carga ejemplo correctamente" do

			menu = MenuDsl.new("Lunes") do
				name = "test"
				desayuno :descripcion => "Magdalenas",
					:porcion => "4 magdalenas",
					:gramos => 100.0,
					:grasas => 32.2,
					:carbohidratos => 54.2,
					:proteinas => 11.0,
					:fibra => 2.3,
					:sal => 0.06
			end

			puts menu.to_s

		end
	end
end

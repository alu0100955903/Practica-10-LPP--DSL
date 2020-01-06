Node = Struct.new(:value, :nest, :prev)

class List

	#Include Enumerable
	include Enumerable

	#Punteros head y tail
	attr_reader :head, :tail
	
	#Creamos una lista e inicializamos los valores
	def initialize (head, tail)
		@head = head
		@tail = tail
	end
	
	#Metodo insertar nodo por cola
        def insertar_por_cola(value)
		nodo=Node.new(value,nil,nil)
                if(@tail==nil)
                        @tail=nodo
                        @head=nodo
                else
                        nodo.prev=@tail
                        @tail.nest=nodo
                        @tail=nodo
			nodo.nest=nil
                end

	end

	#Metodo insertar nodo por cabeza
	def insertar_por_cabeza(value)
		nodo=Node.new(value,nil,nil)
		if(@head==nil)
			@tail=nodo
			@head=nodo
		else
			nodo.nest=@head
			@head.prev=nodo
			@head=nodo
			nodo.prev=nil
		end

	end

	#Metodo extraer nodo por cabeza
        def extraer_por_cabeza
		if(@head==nil)
			puts "No hay nada que extraer (lista vacia)"
		else
			aux=@head
			@head=@head.nest
			if(head!=nil)
				@head.prev=nil
			end
			aux.nest=nil
			if(@head==nil)
				@tail=nil
			end
		end			

		return aux

        end

	#Metodo extraer nodo por cola
	def extraer_por_cola
		if(@tail==nil)
			puts "No hay nada que extraer (lista vacia)"
		else
			aux=@tail
			@tail=@tail.prev
			aux.prev=nil
			if(@tail!=nil)
				@tail.nest=nil
			end
		end
			
		return aux
	end

	#Metodo comprobar si esta vacío
        def vacio
		if(@tail==nil)
			return true
		else
			return false
		end
        end

	#Metodo convertir a cadena
	def to_s

		puntero=@head
		cadena='['
			if(@head!=nil)
				while (puntero!= nil) do
					cadena+=puntero.value.to_s + ']'
					if(puntero.nest!=nil)
						puntero=puntero.nest
						cadena+= '['
					else
						puntero=nil
					end
				end
			end

	end

	#Metodo gases diarios
	def gases
		puntero=@head
		gases=0
		if(@head!=nil)
			while(puntero!=nil) do
				gases+=puntero.value.gei
				if(puntero.nest!=nil)
					puntero=puntero.nest
				else
					puntero=nil
				end
			end
		end
		return gases
	end

	#Metodo tierras por menu
	def tierras
		puntero=@head
		gases=0
		if(@head!=nil)
			while(puntero!=nil) do
				gases+=puntero.value.terreno
				if(puntero.nest!=nil)
					puntero=puntero.nest
				else
					puntero=nil
				end
			end
		end
		return gases
	end

	#Metodo que devuelve las proteinas de la lista
	def get_proteinas
		puntero=@head
		total_proteina=0
		if(@head!=nil)
			while(puntero!=nil) do
				total_proteina += puntero.value.proteinas
				if(puntero.nest!=nil)
					puntero = puntero.nest
				else
					puntero=nil
				end
			end
		end
		return total_proteina
	end

	#Metodo que devuelve los lipidos de la lista
	def get_lipidos
		puntero=@head
		total_lipidos=0
		if(@head!=nil)
			while(puntero!=nil) do
				total_lipidos += puntero.value.lipidos
				if(puntero.nest!=nil)
					puntero = puntero.nest
				else
					puntero=nil
				end
			end
		end
		return total_lipidos
	end

	#Metodo que devuelve la energia de la lista
	def get_energia
		puntero=@head
		total_energia=0
		if(@head!=nil)
			while(puntero!=nil) do
				total_energia += puntero.value.irenergia
				if(puntero.nest!=nil)
					puntero = puntero.nest
				else
					puntero=nil
				end
			end
		end
		return total_energia
	end

	#Metodo que devuelve los lipidos de la lista
	def get_carbo
		puntero=@head
		total_carbohidratos=0
		if(@head!=nil)
			while(puntero!=nil) do
				total_carbohidratos += puntero.value.lipidos
				if(puntero.nest!=nil)
					puntero = puntero.nest
				else
					puntero=nil
				end
			end
		end
		return total_carbohidratos
	end

	#Metodo que devuelve los nutrientes de la lista
	def get_nutrientes
		puntero=@head
		total_nutrientes=0
		if(@head!=nil)
			while(puntero!=nil) do
				total_nutrientes += puntero.value.proteinas + puntero.value.lipidos + puntero.value.carbohidratos
				if(puntero.nest!=nil)
					puntero=puntero.nest
				else
					puntero=nil
				end
			end
		end
		return total_nutrientes
	end

	#Metodo para Enumerar
	def each(&block)
		puntero=@head
		while(puntero!=nil) do
			yield puntero.value
			puntero=puntero.nest
		end
	end
end

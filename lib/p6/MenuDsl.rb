class MenuDsl

 attr_accessor :name, :men, :almuerzo, :cena

 def initialize(name,&block)
  @name =name
  @men = []
  @almuerzo = []
  @cena = []
  if block_given?
   if block.arity == 1
    yield self
   else
    instance_eval(&block)
   end
  end
 end


 def process_comida(comida,options= {})

  comida[:descripcion]   = options[:descripcion]   if options[:descripcion]
  comida[:porcion]       = options[:porcion]       if options[:porcion]
  comida[:gramos]        = options[:gramos]        if options[:gramos]
  comida[:grasas]        = options[:grasas]        if options[:grasas]
  comida[:carbohidratos] = options[:carbohidratos] if options[:carbohidratos]
  comida[:proteinas]     = options[:proteinas]     if options[:proteinas]
  comida[:fibra]         = options[:fibra]         if options[:fibra]
  comida[:sal]           = options[:sal]           if options[:sal]
  comida[:valor]         = valor_kcal(comida)
 
 
  @men << comida
 
 end
 
 def valor_kcal(comida)
 
   valor=0
   valor+=comida[:grasas]*9 if comida[:grasas]
   valor+=comida[:carbohidratos]*4 if comida[:carbohidratos]
   valor+=comida[:proteinas]*4 if comida[:proteinas]
   valor+=comida[:sal]*6 if comida[:sal]
   valor+=comida[:fibra]*2 if comida[:fibra]
   v2=[9,4,4,6,2]
   return valor
 
 
  end
 
  def almuerzo(options={})
   comida={:tipo=>"almuerzo"}
   process_comida(comida,options)
  end
  def desayuno(options={})
   comida={:tipo=>"desayuno"}
   process_comida(comida,options)
  end
  def cena(options={})
   comida={:tipo =>"cena"} 
   process_comida(comida,options)
  end
 
 
  def to_s
   output= @name
   output << "\n"
   output << "#{"=" * (@name.length + 82)}\n"
   output << "\t\tgrasas\tcarbohidratos\tproteinas\tfibra\tsal\tvalor energetico\n" 
   @men.each_with_index do |com,i|
 
    output << "#{com[:tipo]}\n"
    output << "#{com[:descripcion]}\t"
    output << "#{com[:grasas].round(2)}\t"
    output << "#{com[:carbohidratos].round(2)}\t\t"
    output << "#{com[:proteinas].round(2)}\t\t"
    output << "#{com[:fibra].round(2)}\t"
    output << "#{com[:sal].round(2)}\t"
    output << "#{com[:valor].round(2)}\t"
   end
   output
 
  end
end
 
 

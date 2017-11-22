# Representación de un alimento según sus calorías aportadas y la cantidad de glucidos, proteinas y lipidos contenidos
# 
# @author Sebastian Jose Diaz Rodriguez
# @since 1.0.0
# @attr_reader String nombre Nombre del alimento
# @attr_reader Number glucidos glucidos contenidos en el alimento
# @attr_reader Number proteinas preoteinas contenidos en el alimento
# @attr_reader Number lipidos lipidos contenidos en el alimento
class Alimento
    include Comparable
    attr_reader :nombre, :glucidos, :proteinas, :lipidos, :indexGluc
    
    # Constructor de Alimento
    # @param [String] nombre nombre del alimento
    # @param [Number] glucidos glucidos contenidos en el alimento
    # @param [Number] proteinas preoteinas contenidos en el alimento
    # @param [Number] lipidos lipidos contenidos en el alimento
    #
    # @return [Alimento] Devuelve el objeto creado de clase Alimento
    def initialize(nombre, glucidos, proteinas, lipidos)
        @nombre = nombre
        @glucidos = glucidos
        @proteinas = proteinas
        @lipidos = lipidos
        @indexGluc = nil
    end
    
    #Calcula el indice glucemico de un alimento
    #
    #@param data [array] Valores de los datos glucemicos de un alimento
    #@para gluc [array] Valores de la glucosa
    def calculate_index(data, gluc)
        aibc = [[],[]]
        data.each do |x|
			t = 0
			x.each_index do |a| 
				if (a  != 0) 
					t += (((x[a] - x[0]) + (x[a - 1] - x[0])) /2)*5  
				end 
			end 
			aibc[0] << t
		end
		gluc.each do |x|
			t = 0
			x.each_index do |a| 
				if (a  != 0) 
					t += (((x[a] - x[0]) + (x[a - 1] - x[0])) /2)*5
				end 
			end 
			aibc[1] << t
		end
		igind = []
		aibc[0].each_index { |x|  igind << ((aibc[0][x] / aibc[1][x]) * 100)}
		suma = 0
		igind.each{ |x| suma += x}
		@indexGluc = (suma / igind.length)
        
    end
    
    # Convierte el objeto en un String
    # @return [String] descripción del alimento en una cadena de caracteres
    def to_s
        x = "#{nombre}: #{proteinas}g proteínas, #{glucidos}g glúcidos, #{lipidos}g lípidos"
        return x
    end
    
    # Constructor de Alimento
    # @return [Number] Devuelve el valor calórico del alimento representado
    def kcal
        @proteinas * 4 + @glucidos * 4 + @lipidos * 9
    end
    
    # Constructor de Alimento
    # @param [Alimento] other otro objeto de clase Alimento
    # @return [Number] Devuelve la relación de comparación entre el objeto que invoca el método y el otro objeto Alimento
    def <=>(other)
        kcal <=> other.kcal
    end
end
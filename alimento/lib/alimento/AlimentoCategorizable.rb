# Representación de un alimento categorizable según sus calorías aportadas y la cantidad de glucidos, proteinas y lipidos contenidos
# Hereda de la clase Alimento
#
# @author Sebastian Jose Diaz Rodriguez
# @since 1.0.0
# @attr_reader String categoria Categoria del alimento
# @attr_reader String nombre Nombre del alimento
# @attr_reader Number glucidos glucidos contenidos en el alimento
# @attr_reader Number proteinas preoteinas contenidos en el alimento
# @attr_reader Number lipidos lipidos contenidos en el alimento
class AlimentoCategorizable < Alimento
    attr_reader :categoria
    
    # Constructor de Alimento
    # @param [String] nombre nombre del alimento
    # @param [String] categoria categoria del alimento
    # @param [Number] glucidos glucidos contenidos en el alimento
    # @param [Number] proteinas preoteinas contenidos en el alimento
    # @param [Number] lipidos lipidos contenidos en el alimento
    #
    # @return [AlimentoCategorizable] Devuelve el objeto creado de clase AlimentoCategorizable
    def initialize(nombre, categoria, glucidos, proteinas, lipidos)
        super(nombre, glucidos, proteinas, lipidos)
        @categoria = categoria
    end
    
    # Convierte el objeto en un String
    # @return [String] descripción del alimento en una cadena de caracteres
    def to_s
        x = "#{nombre} (#{categoria}) : #{proteinas}g proteínas, #{glucidos}g glúcidos, #{lipidos}g lípidos"
        return x
    end
end
require "Alimento/version"

class Alimento
    attr_reader :nombre, :glucidos, :proteinas, :lipidos
    
    def initialize(nombre, glucidos, proteinas, lipidos)
        @nombre = nombre
        @glucidos = glucidos
        @proteinas = proteinas
        @lipidos = lipidos
    end
    
    def to_s
        x = "#{nombre}: #{proteinas}g proteínas, #{glucidos}g glúcidos, #{lipidos}g lípidos"
        return x
    end
    
    def kcal
        @proteinas * 4 + @glucidos * 4 + @lipidos * 9
    end

end

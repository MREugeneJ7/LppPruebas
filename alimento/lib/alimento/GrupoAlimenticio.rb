# Representación de un grupo alimenticio con categoría
# Hereda de Lista
#
# @author Sebastian Jose Diaz Rodriguez
# @since 1.0.0
# @attr_reader String categoria categoria del grupo alimenticio representado
# @attr_reader Node head Nodo en la cabeza de la lista
# @attr_reader Node tail Nodo en la última posición de la lista
class GrupoAlimenticio < Lista
    attr_reader :categoria
    
    # Constructor de GrupoAlimenticio
    # @param [String] categoria categoria del grupo alimenticio
    #
    # @return [GrupoAlimenticio] Devuelve el objeto creado de clase GrupoAlimenticio
    def initialize(categoria)
        super()
        @categoria = categoria
    end
    
    # Inserción de AlimentoCategorizable por la cabeza de la lista del GrupoAlimenticio
    # @param [any] x valor del nuevo nodo
    #
    # @return [Node] Devuelve el head
    def push_alimento(x)
        if(x.is_a?(AlimentoCategorizable))
            push_head(AlimentoCategorizable.new(x.nombre, @categoria, x.glucidos, x.proteinas, x.lipidos))
        end
    end
    
    # Inserción de varios AlimentoCategorizable por la cabeza de la lista del GrupoAlimenticio
    # @param [Array<any>] x valores de los nuevos nodos
    #
    # @return [Node] Devuelve el head
    def push_alimentos(x)
        x.each do |alimento|
            if(alimento.is_a?(AlimentoCategorizable))
                push_head(AlimentoCategorizable.new(alimento.nombre, @categoria, alimento.glucidos, alimento.proteinas, alimento.lipidos))
            end
        end
    end
    
    # Extracción del primer AlimentoCategorizable del GrupoAlimenticio
    #
    # @return [any, nil] devuelve el valor guardado en el primer nodo o nil si no hay nodos en el GrupoAlimenticio
    def pop_alimento()
        pop_head()
    end
end
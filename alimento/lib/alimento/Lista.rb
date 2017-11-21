# Representación de un nodo en una lista
#
# @author Sebastian Jose Diaz Rodriguez
# @since 1.0.0
# @attr_accessor any value Informacion contenida en el nodo
# @attr_accessor Node next Nodo siguiente con el que esta conectado
# @attr_accessor Node prev Nodo previo con el que esta conectado
Node = Struct.new(:value, :next, :prev)

# Representación de una lista doblemente enlazada de nodos
# 
# @author Sebastian Jose Diaz Rodriguez
# @since 1.0.0
# @attr_reader Node head Nodo en la cabeza de la lista
# @attr_reader Node tail Nodo en la última posición de la lista
class Lista
    include Enumerable
    attr_reader :head, :tail
    
    # Inserción por la cabeza de la lista
    # @param [any] x valor del nuevo nodo
    #
    # @return [Node] Devuelve el head
    def push_head(x)
        if(@head == nil)
            @head = Node.new(x, nil, nil)
            @tail = @head
        else
            nuevo = Node.new(x, nil, nil)
            nuevo.next= @head
            @head.prev = nuevo
            @head = nuevo
        end
    end
    
    # Inserción por la cola de la lista
    # @param [any] x valor del nuevo nodo
    #
    # @return [Node] Devuelve el tail
    def push_tail(x)
        if(@tail == nil)
            @tail = Node.new(x, nil, nil)
            @head = @tail
        else
            nuevo = Node.new(x, nil, nil)
            nuevo.prev = @tail
            @tail.next = nuevo
            @tail = nuevo
        end
    end
    
    # Inserción por la cola de la lista de varios nodos
    # @param [Array<any>] x valores de los nuevos nodos
    #
    # @return [Node] Devuelve el tail
    def push(x)
        x.each{
            |i| push_tail(i)
        }
    end
    
    # Extracción del primer nodo de la lista
    #
    # @return [any, nil] devuelve el valor guardado en el primer nodo o nil si no hay nodos en la lista
    def pop_head()
        if(@head == nil)
            return nil
        end
        
        x = @head
        @head = @head.next
        if(@head == nil)
            @tail = nil
        else
            @head.prev = nil
            x.next = nil
        end
        x.value
    end
    
    # Extracción del último nodo de la lista
    #
    # @return [any, nil] devuelve el valor guardado en el último nodo o nil si no hay nodos en la lista
    def pop_tail()
        if(@tail == nil)
            return nil
        end
        
        x = @tail
        @tail = @tail.prev
        if(@tail == nil)
            @head = nil
        else
            @tail.next = nil
            x.prev = nil
        end
        x.value
    end
    
    # Método para la enumeración de los nodos de la lista
    #
    # @return [Node] devuelve los nodos que conforman la lista
    def each
        x = @head
        while(x != nil)
            yield x.value
            x = x.next
        end
    end
end
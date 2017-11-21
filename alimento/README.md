# Alimento

La gema Alimento contiene la clase alimento, la cual permite la creación de un objeto Alimento con un identificador literal y unas componentes
basadas en los glúcidos, lípidos y proteínas para gestionar las calorías proporcionadas por este.

## Instalación

Añade esta línea a tu documento Gemgfile:

```ruby
gem 'Alimento'
```

y ejecuta el comando:

    $ bundle

O realiza una instalación directa con:

    $ gem install Alimento

## Detalles de las clases

### Alimento
- Creacion de Alimento: Alimento.new(Nombre, gr glúcidos, gr proteínas, gr lípidos).
- Tiene métodos para el acceso de lectura a los atributos _nombre_, _glucidos_, _proteinas_ y _lipidos_.
- kcal: método para el cálculo. Devuelve el valor energético del alimento en kilocalorías.
- Es comparable

### AlimentoCategorizable
- Creacion de AlimentoCategorizable: AlimentoCategorizable.new(Nombre, categoria, gr glúcidos, gr proteínas, gr lípidos)
- Hereda la funcionalidad de Alimento
- Tiene un atributo _categoria_, su grupo alimenticio, y métodos para su acceso de lectura

### Node
- Creacion de Node: Node.new(valor, nodo siguiente, nodo previo).
- Tiene métodos de acceso y modificación de los atributos _value_, _next_ y _prev_.

### Lista
- Creacion de Lista: Lista.new()
- Tiene métodos de acceso para sus atributos _head_ y _tail_, lo que permite hacer comprobación del contenido previa sustracción o inserción.
- Tiene métodos para la extracción (*pop_head*, *pop_tail*) para eliminar un nodo de la lista y obtener su contenido (su valor Node.value).
- Tiene métodos para la inserción de elementos (*push_head(x)*, *push_tail*) para la inclusión de un nodo en la lista.
- Es enumerable

### GrupoAlimenticio
- Creacion de GrupoAlimenticio: GrupoAlimenticio.new(Categoria).
- Hereda su funcionalidad de la lista
- Tiene un atributo _categoria_ que define la categoria de los alimentos que se meten en la lista, y su método de lectura

## Licencia

La gema está disponible como código abierto bajo los términos de la [Licencia MIT](http://opensource.org/licenses/MIT).
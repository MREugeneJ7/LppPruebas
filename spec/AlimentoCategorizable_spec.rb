require "spec_helper"
require 'benchmark'

RSpec.describe AlimentoCategorizable do
  before :all do
    @manzana = AlimentoCategorizable.new("manzana", "Fruta", 10, 10, 10)
    @pera = AlimentoCategorizable.new("pera", "Fruta", 1, 2, 3)
  end
  it "has a version number" do
    expect(AlimentoCategorizable::VERSION).not_to be nil
  end
  context "Elementos básicos del alimento" do
    it "Tiene los atributos nombre, categoria, proteinas, glucidos y lipidos" do
      expect(@manzana).to respond_to(:nombre, :categoria, :glucidos, :proteinas, :lipidos)
    end
    it "Tiene un método para obtener el nombre" do
      expect(@manzana.nombre).to eq("manzana")
    end
    it "Tiene un método para obtener la categoría" do
      expect(@manzana.categoria).to eq("Fruta")
    end
    it "Tiene un método para obtener el glucidos" do
      expect(@manzana.glucidos).to eq(10)
    end
    it "Tiene un método para obtener el proteinas" do
      expect(@manzana.proteinas).to eq(10)
    end
    it "Tiene un método para obtener el lipidos" do
      expect(@manzana.lipidos).to eq(10)
    end
  end
  
  context "Formateo del alimento" do
    it "Tiene un método para obtener el alimento formateado" do
      expect(@manzana.to_s).to eq("manzana (Fruta) : 10g proteínas, 10g glúcidos, 10g lípidos")
    end
  end
  context "Valor energético" do
    it "Tiene un método para obtener el valor energético del alimento" do
      expect(@pera.kcal).to eq(2*4 + 1*4 + 3*9)
    end
  end
  
  context "Jerarquía de AlimentoCategorizable" do
    it "Esta definido como un objeto de clase AlimentoCategorizable" do
      expect(@manzana).to be_instance_of(AlimentoCategorizable)
    end
    it "Hereda de la clase Alimento" do
      expect(@manzana).to be_kind_of(Alimento)
    end
    it "Pertenece a una jerarquía" do
      expect(@manzana).to be_kind_of(Object)
    end
  end
  
  context "Ordenaciones"
  before :each do
    def bubblesort_for (array)
      for i in 0..array.size 
        for j in i+1..array.size-1    
          array[i], array[j] = array[j], array[i] if(array[i] > array[j])
        end
      end
      array
    end
    def bubblesort_each (array)
      array.each do
        swap_count = 0
        array.each_with_index do |a, index|
          break if index == (array.length - 1)
          if a > array[index + 1]
            array[index],array[index + 1] = array[index + 1], array[index]
            swap_count += 1
          end
        end
        break if swap_count == 0
      end
      array
    end
    @L = [ AlimentoCategorizable.new("Huevo frito","Huevos y Lacteos", 14.1, 0.0, 19.5),
      AlimentoCategorizable.new("Leche vaca","Huevos y Lacteos" , 3.3, 4.8, 3.2),
      AlimentoCategorizable.new("Yogurt","Huevos y Lacteos", 3.8, 4.9, 3.8),
      AlimentoCategorizable.new("Cerdo","Carnes y Derivados", 21.5, 0.0, 6.3),
      AlimentoCategorizable.new("Ternera","Carnes y Derivados", 21.1, 0.0, 3.1),
      AlimentoCategorizable.new("Pollo","Carnes y Derivados", 20.6, 0.0, 5.6),
      AlimentoCategorizable.new("Bacalao","Pescados y Mariscos", 17.7, 0.0, 0.4),
      AlimentoCategorizable.new("Atun","Pescados y Mariscos", 21.5, 0.0, 15.5),
      AlimentoCategorizable.new("Salmon","Pescados y Mariscos", 19.9, 0.0, 13.6),
      AlimentoCategorizable.new("Aceite de oliva","Alimentos Grasos", 0.0, 0.2, 99.6),
      AlimentoCategorizable.new("Mantequilla","Alimentos Grasos", 0.7, 0.0, 83.2),
      AlimentoCategorizable.new("Chocolate","Alimentos Grasos", 5.3, 47.0, 30.0),
      AlimentoCategorizable.new("Azucar","Alimentos Ricos en Carbohidratos", 0.0, 99.8, 0.0),
      AlimentoCategorizable.new("Arroz","Alimentos Ricos en Carbohidratos", 6.8, 77.7, 0.6),
      AlimentoCategorizable.new("Lentejas","Alimentos Ricos en Carbohidratos", 23.5, 52.0, 1.4),
      AlimentoCategorizable.new("Papas","Alimentos Ricos en Carbohidratos", 2.0, 15.4, 0.1),
      AlimentoCategorizable.new("Tomate","Verduras y Hortalizas", 1.0, 3.5, 0.2),
      AlimentoCategorizable.new("Cebolla","Verduras y Hortalizas", 1.3, 5.8, 0.3),
      AlimentoCategorizable.new("Calabaza","Verduras y Hortalizas", 1.1, 4.8, 0.1),
      AlimentoCategorizable.new("Manzana","Frutas", 0.3, 12.4, 0.4),
      AlimentoCategorizable.new("Platanos","Frutas", 1.2, 21.4, 0.2),
      AlimentoCategorizable.new("Pera","Frutas", 0.5 ,12.7, 0.3)]
  end
  
  it "Benchmark" do
    Benchmark.bmbm do |test|
      test.report("Con el metodo sort\n")  { @L.dup.sort }
      test.report("Con el metodo for\n") {bubblesort_for(@L.dup)}
      test.report("Con el metodo each \n") {bubblesort_each(@L.dup)}
    end
  end
  
  
end
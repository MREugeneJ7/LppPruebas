require "spec_helper"

RSpec.describe GrupoAlimenticio do
  before :each do
      @list1 = GrupoAlimenticio.new("Fruta")
      @nodo = AlimentoCategorizable.new("Manzana", "Helados", 10, 10, 10)
      @nodo2 = AlimentoCategorizable.new("Pera", "Verduras", 5, 5, 5)
  end
  
  it "has a version number" do
    expect(GrupoAlimenticio::VERSION).not_to be nil
  end
  context "Grupo Alimenticio - Lista categórica de alimentos" do
    it "tiene cabeza y cola" do
        expect(@list1).to have_attributes(:head => nil, :tail => nil)
    end
    
    it "puede insertar un nodo por la cabeza" do
        @list1.push_head(15)
        expect(@list1.head.value).to eq(15)
    end
    it "puede insertar un nodo por la cola" do
        @list1.push_tail(10)
        expect(@list1.tail.value).to eq(10)
    end
    
    it "puede insertar varios nodos" do
        @list1.push([1,2,3])
        expect(@list1.head.value).to eq(1)
        expect(@list1.head.next.value).to eq(2)
        expect(@list1.head.next.next.value).to eq(3)
    end
    
    it "puede extraer el nodo de la cabeza" do
        expect(@list1.pop_head).to be_nil
        @list1.push_head(5)
        expect(@list1.pop_head).to eq(5)
    end
    
    it "puede extraer el nodo de la cola" do
        expect(@list1.pop_tail).to be_nil
        @list1.push_head(10)
        expect(@list1.pop_tail).to eq(10)
    end
    
    it "Puede insertar un nodo de alimento" do
        @list1.push_alimento(@nodo)
        expect(@list1.head.value).to have_attributes(:nombre => "Manzana", :categoria => "Fruta", :glucidos => 10, :proteinas => 10, :lipidos => 10)
    end
    
    it "Puede insertar varios alimentos" do
        @list1.push_alimentos([@nodo, @nodo2])
        expect(@list1.head.value).to have_attributes(:nombre => "Pera", :categoria => "Fruta", :glucidos => 5, :proteinas => 5, :lipidos => 5)
        expect(@list1.head.next.value).to have_attributes(:nombre => "Manzana", :categoria => "Fruta", :glucidos => 10, :proteinas => 10, :lipidos => 10)
    end
    
    it "Puede extraerse un alimento" do
        @list1.push_alimentos([@nodo, @nodo2])
        expect(@list1.pop_alimento).to have_attributes(:nombre => "Pera", :categoria => "Fruta", :glucidos => 5, :proteinas => 5, :lipidos => 5)
    end
  end
end
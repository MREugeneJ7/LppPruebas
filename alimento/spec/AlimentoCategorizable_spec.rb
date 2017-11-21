require "spec_helper"

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
end
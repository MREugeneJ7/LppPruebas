require "spec_helper"

RSpec.describe Alimento do
  before :all do
    @manzana = Alimento.new("manzana", 10, 10, 10)
    @pera = Alimento.new("pera", 1, 2, 3)
  end
  
  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end
  
  context "Elementos básicos del alimento" do
    it "Tiene los atributos nombre, proteinas, glucidos y lipidos" do
      expect(@manzana).to have_attributes(:nombre => "manzana", :proteinas => 10, :glucidos => 10, :lipidos => 10, :indexGlucose => nil)
    end
    it "Es comparable" do
      expect(@manzana > @pera).to be(true)
      expect(@pera < @manzana).to be(true)
      expect(@manzana >= @pera).to be(true)
      expect(@pera <= @manzana).to be(true)
      expect(@manzana == @manzana).to be(true)
    end
    it "Tiene un método para obtener el nombre" do
      expect(@manzana.nombre).to eq("manzana")
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
      expect(@manzana.to_s).to eq("manzana: 10g proteínas, 10g glúcidos, 10g lípidos")
    end
  end
  context "Valor energético" do
    it "Tiene un método para obtener el valor energético del alimento" do
      expect(@pera.kcal).to eq(2*4 + 1*4 + 3*9)
    end
  end
end

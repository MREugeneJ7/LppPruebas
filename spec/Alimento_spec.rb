require "spec_helper"

RSpec.describe Alimento do
  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end
  context "Atributos" do
    it "Tiene los atributos nombre, proteinas, glucidos y lipidos" do
      expect(Alimento.new("manzana", 10, 10, 10)).to have_attributes(:nombre => "manzana", :proteinas => 10, :glucidos => 10, :lipidos => 10)
    end

  end
  
end

require 'conjured_item'
require 'gilded_rose'

describe ConjuredItem do

  subject { described_class.new("Conjured Axe", 6, 30)}

  it 'can initialize a ConjuredItem object with name, sell_in & quality properties' do
    expect(subject).to be_an_instance_of(ConjuredItem)
    expect(subject.name).to eq("Conjured Axe")
    expect(subject.sell_in).to eq(6)
    expect(subject.quality).to eq(30)
  end

end
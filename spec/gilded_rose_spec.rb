require 'gilded_rose'

describe GildedRose do

  it 'initializes objects with items' do

    test_item1 = instance_double(Item, name:"test item1", sell_in: 10, quality: 20)
    test_item2 = instance_double(Item, name:"test item2", sell_in: 10, quality: 20)
    test_item_list = Array.new.push(test_item1, test_item2)

    subject = GildedRose.new(test_item_list)
    expect(subject).to be_an_instance_of(GildedRose)
    expect(subject.items).to eq(test_item_list)
  end

end
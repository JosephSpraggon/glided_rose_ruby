require 'gilded_rose'

describe GildedRose do

  let (:test_item_list){
    test_item1 = Item.new("test item1",10, 20)
    test_item2 = Item.new("test item2",5, 40)
    test_item_list = Array.new.push(test_item1, test_item2)
  }


  subject {described_class.new(test_item_list)}

  it 'initialize a GildedRose object with items' do
    expect(subject).to be_an_instance_of(GildedRose)
    expect(subject.items).to eq(test_item_list)
  end

  context '#update_quality' do
    
    it 'normal items sell_in & quality decrease by 1' do
      subject.update_quality
      expect(subject.items[0].sell_in).to eq(9)
      expect(subject.items[0].quality).to eq(19)
      expect(subject.items[1].sell_in).to eq(4)
      expect(subject.items[1].quality).to eq(39)
    end

    it 'normal items quality decreases by 2 after sell by date' do
      5.times{subject.update_quality}
      expect(subject.items[1].quality).to eq(35)
      subject.update_quality
      expect(subject.items[1].quality).to eq(33)
    end

  end

end
require 'gilded_rose'

describe GildedRose do

  let (:test_item_list){
    test_item1 = Item.new("test item1",10, 20)
    test_item2 = Item.new("test item2",5, 40)
    aged_brie = Item.new("Aged Brie", 30, 20)
    backstage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 30, 10)
    sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 50, 50)
    Array.new.push(test_item1, test_item2, aged_brie, backstage_passes, sulfuras)
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

    it 'quality of an item is never negative' do
      100.times{subject.update_quality}
      expect(subject.items[0].quality).to eq(0)
      expect(subject.items[1].quality).to eq(0)
    end

    it 'quality of an item is never over 50' do
      100.times{subject.update_quality}
      expect(subject.items[2].quality).to eq(50)
    end

    context "Aged Brie" do

      it 'increases in quality the older it gets' do
        30.times{subject.update_quality}
        expect(subject.items[2].sell_in).to eq(0)
        expect(subject.items[2].quality).to eq(50)
      end

    end

    context 'Backstage passes' do

      it 'increases in quality as sell_in goes down' do
        subject.update_quality
        expect(subject.items[3].quality).to eq(11)
      end

      it 'quality increases by 2 when 10 days or less to sell_in' do
        20.times{subject.update_quality}
        expect(subject.items[3].quality).to eq(30)
        subject.update_quality
        expect(subject.items[3].quality).to eq(32)
      end

      it 'quality increases by 3 when 5 days or less to sell_in' do
        25.times{subject.update_quality}
        expect(subject.items[3].quality).to eq(40)
        subject.update_quality
        expect(subject.items[3].quality).to eq(43)
      end

    end

    context 'Sulfuras' do

        it 'quailty or sell_in never goes down' do
          subject.update_quality
          expect(subject.items[4].quality).to eq(50)
          expect(subject.items[4].sell_in).to eq(50)
        end

    end

  end

end
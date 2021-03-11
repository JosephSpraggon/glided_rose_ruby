require 'gilded_rose'

describe GildedRose do
  let(:test_item_list) do
    test_item1 = Item.new('test item1', 10, 20)
    test_item2 = Item.new('test item2', 5, 40)
    aged_brie = Item.new('Aged Brie', 30, 20)
    backstage_passes = Item.new('Backstage passes to a TAFKAL80ETC concert', 30, 10)
    sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 50, 50)
    [].push(test_item1, test_item2, aged_brie, backstage_passes, sulfuras)
  end

  let(:conjured_item_list) do
    conjured_axe = ConjuredItem.new('Conjured Axe', 6, 30)
    conjured_sword = ConjuredItem.new('Conjured Sword', 8, 40)
    conjured_hammer = ConjuredItem.new('Conjured Hammer', 2, 10)
    [].push(conjured_axe, conjured_sword, conjured_hammer)
  end

  let(:conjured_subject) { described_class.new(conjured_item_list) }

  subject { described_class.new(test_item_list) }

  it 'initialize a GildedRose object with items' do
    expect(subject).to be_an_instance_of(GildedRose)
    expect(subject.items).to eq(test_item_list)
  end

  context '#new_day' do
    it 'normal items sell_in & quality decrease by 1' do
      subject.new_day
      expect(subject.items[0].sell_in).to eq(9)
      expect(subject.items[0].quality).to eq(19)
      expect(subject.items[1].sell_in).to eq(4)
      expect(subject.items[1].quality).to eq(39)
    end

    it 'normal items quality decreases by 2 after sell by date' do
      5.times { subject.new_day }
      expect(subject.items[1].quality).to eq(35)
      subject.new_day
      expect(subject.items[1].quality).to eq(33)
    end

    it 'quality of an item is never negative' do
      100.times { subject.new_day }
      expect(subject.items[0].quality).to eq(0)
      expect(subject.items[1].quality).to eq(0)
    end

    it 'quality of an item is never over 50' do
      100.times { subject.new_day }
      expect(subject.items[2].quality).to eq(50)
    end

    context 'Aged Brie' do
      it 'increases in quality the older it gets' do
        30.times { subject.new_day }
        expect(subject.items[2].sell_in).to eq(0)
        expect(subject.items[2].quality).to eq(50)
      end
    end

    context 'Backstage passes' do
      it 'increases in quality as sell_in goes down' do
        subject.new_day
        expect(subject.items[3].quality).to eq(11)
      end

      it 'quality increases by 2 when 10 days or less to sell_in' do
        20.times { subject.new_day }
        expect(subject.items[3].quality).to eq(30)
        subject.new_day
        expect(subject.items[3].quality).to eq(32)
      end

      it 'quality increases by 3 when 5 days or less to sell_in' do
        25.times { subject.new_day }
        expect(subject.items[3].quality).to eq(40)
        subject.new_day
        expect(subject.items[3].quality).to eq(43)
      end
    end

    context 'Sulfuras' do
      it 'quality or sell_in never goes down' do
        subject.new_day
        expect(subject.items[4].quality).to eq(50)
        expect(subject.items[4].sell_in).to eq(50)
      end
    end

    context 'Conjured Items' do
      it 'decrease in quality twice as fast as normal items' do
        conjured_subject.new_day
        expect(conjured_subject.items[0].sell_in).to eq(5)
        expect(conjured_subject.items[0].quality).to eq(28)
        expect(conjured_subject.items[1].sell_in).to eq(7)
        expect(conjured_subject.items[1].quality).to eq(38)
        expect(conjured_subject.items[2].sell_in).to eq(1)
        expect(conjured_subject.items[2].quality).to eq(8)
      end

      it 'quality of a conjured item is never negative' do
        100.times{conjured_subject.new_day}
        expect(conjured_subject.items[0].quality).to eq(0)
        expect(conjured_subject.items[1].quality).to eq(0)
        expect(conjured_subject.items[2].quality).to eq(0)
      end
    end
  end
end

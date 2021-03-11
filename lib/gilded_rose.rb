require_relative 'item'

class GildedRose
  attr_reader :items

  SPECIAL_ITEMS = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"]

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !SPECIAL_ITEMS.include?(item.name) && item.quality > 0 then item.quality -= 1
      else
        item.quality < 50 ? item.quality += 1 : nil
        if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 11 && item.quality < 50 then item.quality += 1
          item.sell_in < 6 && item.quality < 50 ? item.quality += 1 : nil
        end
      end
      item.name != "Sulfuras, Hand of Ragnaros" ? item.sell_in -= 1 : nil
      if item.sell_in < 0
        if item.sell_in < 0
          if !SPECIAL_ITEMS.include?(item.name) then item.quality > 0  ? item.quality -= 1 : item.quality -= item.quality
          else item.quality < 50 ? item.quality += 1 : nil
          end
        end
      end
    end
  end
  
end
require_relative 'item'

class GildedRose
  attr_reader :items

  SPECIAL_ITEMS = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"]

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !SPECIAL_ITEMS.include?(item.name) && item.quality > 0
        item.quality = item.quality - 1
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert" && item.sell_in < 11 && item.quality < 50
              item.quality = item.quality + 1
            if item.sell_in < 6 && item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros" ? item.sell_in = item.sell_in - 1 : false
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50 ? item.quality = item.quality + 1 : nil
          end
        end
      end
    end
  end
end
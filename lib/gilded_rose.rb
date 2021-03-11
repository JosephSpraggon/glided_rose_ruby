# frozen_string_literal: true

require_relative 'item'
require_relative 'conjured_item'

class GildedRose
  attr_reader :items

  SPECIAL_ITEMS = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros'].freeze

  def initialize(items)
    @items = items
  end

  def new_day
    update_quality
    update_sell_in
  end

  private

  def update_sell_in
    @items.each do |item|
      item.name != 'Sulfuras, Hand of Ragnaros' ? item.sell_in -= 1 : nil
      if item.sell_in.negative?
        if !SPECIAL_ITEMS.include?(item.name) then item.quality -= item.quality.positive? ? 1 : item.quality
        else item.quality < 50 ? item.quality += 1 : nil
        end
      end
    end
  end

  def update_quality
    @items.each do |item|
      if item.instance_of? ConjuredItem then item.quality -= 2
      else
        if !SPECIAL_ITEMS.include?(item.name) && item.quality.positive? then item.quality -= 1
        else
          item.quality < 50 ? item.quality += 1 : nil
          if item.name == 'Backstage passes to a TAFKAL80ETC concert' && item.sell_in < 11 && item.quality < 50 then item.quality += 1
                                                                                                                     item.sell_in < 6 && item.quality < 50 ? item.quality += 1 : nil
          end
        end
      end
    end
  end
end

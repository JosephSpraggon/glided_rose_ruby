*Joe's Gilded Rose Tech Test*

 --------------------------------------------------

 *Setup:*

This project runs on Ruby 2.7.0 

Firstly to run the tests as well as check the test coverage you'll need the following gems in your Gemfile:

'rspec'
'simplecov'
'rubocop'

As well as "source 'http://rubygems.org'" at the top!

Then  run 'bundle install' in the command-line.

Once all gems are bundled you can run 'rspec' in the command-line and you should see all green tests

You can also run the linter 'rubocop' by running 'rubocop' in the command-line and hopefully not see too many offenses 😅

--------------------------------------------------

*Running the project:*

In the command-line make sure you're within the ruby directory and run "irb -r './lib/gilded_rose.rb'"

Then create a new list of items in an array 'Array.new' then you can ".push" items into it! First you need to create items using 'Item.new(name, sell_in, quality)' and make some conjured items using 'ConjuredItems.new(name, sell_in, quality)'. Feed the array of items into the instance of the GildedRose class 'GildedRose.new(Array)'. Now you can use the method 'new_day' and watch all the items respond accordingly!

--------------------------------------------------

*Client Specification:*

This is a well known kata developed by Terry Hughes. This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
- We have recently signed a supplier of conjured items. This requires an update to our system:

- “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

The brief:
Choose legacy code (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

HINT: Test first FTW!

--------------------------------------------------

*How I Achieved This:* 

It took me a while to figure out the best approach to taking on this task. This was my first time dealing with legacy code and trying to read someone elses code and figure out how it worked, took me a little while.

Once I got the hang of how the code was running and knowing that although messy the code was working as intended, I thought the best approach would be to write a load of tests to the existing code 
#Joe's Gilded Rose Tech Test
 --------------------------------------------------

 ##Setup:

This project runs on Ruby 2.7.0 

Firstly to run the tests as well as check the test coverage you'll need the following gems in your Gemfile:
```
'rspec'
'simplecov'
'rubocop'
```
As well as "source 'http://rubygems.org'" at the top!

Then  run 'bundle install' in the command-line.

Once all gems are bundled you can run 'rspec' in the command-line and you should see all green tests

You can also run the linter 'rubocop' by running 'rubocop' in the command-line and hopefully not see too many offenses 😅

--------------------------------------------------

##Running the project:

In the command-line make sure you're within the ruby directory and run "irb -r './lib/gilded_rose.rb'"

Then create a new list of items in an array 'Array.new' then you can ".push" items into it! First you need to create items using 'Item.new(name, sell_in, quality)' and make some conjured items using 'ConjuredItems.new(name, sell_in, quality)'. Feed the array of items into the instance of the GildedRose class 'GildedRose.new(Array)'. Now you can use the method 'new_day' and watch all the items respond accordingly!

<img width="1638" alt="Screenshot 2021-03-11 at 17 34 44" src="https://user-images.githubusercontent.com/74933838/110934348-cd84e780-8325-11eb-8dac-f287a7117210.png">

--------------------------------------------------

##Client Specification:

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

##How I Achieved This:

It took me a while to figure out the best approach to taking on this task. This was my first time dealing with legacy code and trying to read someone elses code and figure out how it worked, took me a little while.

Once I got the hang of how the code was running and knowing that, although messy, the code was working as intended, I thought the best approach would be to write a load of tests to the existing code.

I did this by testing all the criteria brought up in the client specification, for  both normal items and the special items (Aged brie, Backstage passes, Sulfuras). To do this a had to create a 'test_item_list' and then feed it to a 'described_class.new(items)'.

Once I had tests that covered all aspects of the 'GildedRose' class and '#update_quality' method covered I knew that I could begin refactoring and messing around the code and then run 'rspec' to make sure the code is still working correctly!

I started by bring down the massive line count for '#update_quality'. I did this by using logical operators, if/then statements & ternary operators to cut down unnecessarily long if/else statements.

Once I had cut down the method as much as I thought was possible I could see that the '#update_quality' method not only responsible for updating the items quality property but also the items 'sell_in' property. It made sense to then split this method down the middle into '#update_quality' & '#update_sell_in'.

However, now of course, almost all my tests were failing. This was because they were testing that both the 'quality' & 'sell_in' properties which before were being changed in within the old '#update_quality' method. so I thought to solve this I made my two new methods private and created a new method '#new_day' which would call both of the private methods together, so the codes functionality remained intact.

With the legacy code refactored to the point I was happy with I thought it was time to implement the new 'Conjured' items. It seemed that these should act very similarly to the normal items however with the client specified requirement that they should degrade in Quality twice as fast as normal items.

To accomplish this I made a 'ConjuredItem' class that worked exactly the same as normal item classes. I then wrote tests that checked if an item object was a 'ConjuredItem' that is was expected for the quality to drop twice as fast. Then to implement this into the code, I simple ran a check 'instance_of?' method on each item in the list and if it was a 'Conjured' one it's quality would drop byt -= 2 rather than -= 1.

--------------------------------------------------

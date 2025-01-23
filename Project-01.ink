/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

/*
Rooms
- Bedroom (start)
- Hallway
- Kitchen
- Yard
- Basement
- Garage
- Driveway
- Attic
- Living room
- Bathroom

Obstacles
- Can't walk on hardwood without slippers
- Can't go outside without pants
- Find menu
- Phone dead
- Door frozen shut
- Can't walk outside without flashlight
- Can't drive without keys
- Can't pull down attic stairs
- Key to basement
- Weapon for satan

Endings
- Go to bed
- Alien abduction
- Get kidnapped / Fight satan
- Get food
- Go to alternate dimension
- House explodes
- Killed by clown
- Tunnels
- Midnight snack

Items
- Slippers - next to couch
- Pants - bathroom
- Menu - Kitchen
- Phone Charger?
- Lighter
- Flashlight/phone - attic
- Car Keys - garage
- Basement Key - yard
- The claw - closet
- Ceremonial dagger - attic
- Sacred Text - basement
- 3 Keys to the chest - glovebox
*/




-> intro
== intro ==
It's 12am. You can't sleep. Your stomach grumbles. Maybe a snack would help you sleep?
+[Get up] -> bedroom
+[Stay in bed] -> too_sleepy


== too_sleepy ==
You decide it's not worth it. The bed is so cozy all of a sudden and eating would give you too much energy anyway. 



Right?


Too Sleepy
Ending 1/???
+[Restart] ->intro


== bedroom ==
Begrudgingly, you get out of bed. Your messy bedroom surrounds you. Clothes are strewn across the floor as well as the remnants of previous midnight snacks.
+[Go into hallway] ->hallway
+[Check phone] ->check_phone
+[Search closet] ->closet
/*
put OR statement
*/


== check_phone ==
{check_phone: Still dead.|Drat! Your phone is dead. You must have forgotten to plug it in.}
[Go back] ->bedroom
/*
figure out IF statement
*/


== closet ==
{claw_pickup: You don't find anything useful.|You find a mechanical claw you got at a carnival a few years ago. It looks pretty cool.}
*[Pick up claw] ->claw_pickup
+[Go back] ->bedroom


== claw_pickup ==
You pick up The Claw.
*[Go back] ->bedroom


== hallway ==
You enter your hallway. Pictures line the wall. There's a door to your right and a room at the end of the hallway.
+[Continue down hallway] ->living_room
+[Go through door] ->bathroom
+[Check window] ->hall_window


== hall_window ==
You peer through the hall's window. You think you see a figure dash through the trees. Must have been a deer.
+[Go back] ->hallway
/*
IF statement
*/


== bathroom ==
{slipper_pickup: You enter the bathroom. It's surpriseingly clean expect for the pile of clothes on the floor.
+[Search pile] ->clothes_pile
+[Check mirror] ->bathroom_mirror
|The door leads to your bathroom, but you don't have your slippers! There's no way your leaving the carpeted floor without them.}
/*
conditional choices
*/


== clothes_pile ==
{pants_pickup: There's only t-shirts.|You search through the pile and find the only pair of pants that you own.}
*[Equip pants] ->pants_pickup
+[Go back] ->bathroom


== pants_pickup ==
You put the pants on. You really need to get another pair.
*[Go back] ->bathroom


== bathroom_mirror ==
You don't see anything.
+[Go back] ->bathroom

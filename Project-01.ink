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
- screwdriver - garage
*/




-> intro
== intro ==
It's 12am. You can't sleep. Your stomach grumbles. Maybe a snack would help you sleep?
+[Get up] -> bedroom
+[Stay in bed] ->endings.too_sleepy


== endings ==
=too_sleepy
You decide it's not worth it. The bed is so cozy all of a sudden and eating would give you too much energy anyway. 



Right?


Too Sleepy
Ending 1/???
->DONE

=alternate_dimension
write something


Alternate Dimension
Ending 2/???
->DONE

=midnight_snack
You make some delicious toast and put your favorite topping on it. You're content enough to go back to sleep, but only content. 


Midnight Snack
Ending 3/???
->DONE

=alien_abduction
write something


Alien Abduction
Ending 4/???
->DONE


== bedroom ==
{Begrudgingly, you get out of bed. Your messy bedroom surrounds you. Clothes are strewn across the floor as well as the remnants of previous midnight snacks.|You're in your bedroom}
+[Go into hallway] ->hallway
+[Check phone] ->bedroom.check_phone
+[Search closet] ->bedroom.closet

=check_phone
{Drat! Your phone is dead. You must have forgotten to plug it in.|Still dead.}
[Go back] ->bedroom

=closet
{claw_pickup: You don't find anything useful.|You find a mechanical claw you got at a carnival a few years ago. It looks pretty cool.}
*[Pick up claw] ->bedroom.claw_pickup
+[Go back] ->bedroom

=claw_pickup
You pick up The Claw.
*[Go back] ->bedroom


== hallway ==
You enter your hallway. Pictures line the wall. There's a door to your right and a room at the end of the hallway.
+[Continue down hallway] ->living_room
+[Go through door] ->bathroom.entry
+[Check window] ->hallway.hall_window

=hall_window
{You peer through the hall's window. You think you see a figure dash through the trees. Must have been a deer.|You only see trees}
+[Go back] ->hallway


== bathroom ==
{You enter the bathroom. It's surpriseingly clean expect for the pile of clothes on the floor.|You're in your bathroom}
+[Search Pile] ->bathroom.clothes_pile
+[Check mirror] ->bathroom.bathroom_mirror
+[Go to the hallway] ->hallway

= entry
{
    -slipper_pickup:
        ->bathroom
    -not slipper_pickup:
        ->hallway
}

=clothes_pile
{pants_pickup: There's only t-shirts.|You search through the pile and find the only pair of pants that you own.}
*[Equip pants] ->bathroom.pants_pickup
+[Go back] ->bathroom

=pants_pickup
You put the pants on. You really need to get another pair.
*[Go back] ->bathroom

=bathroom_mirror
You don't see anything.
+[Go back] ->bathroom


== living_room ==
{You enter your living room. It's where you spend most of your time. I wonder if you forgot anything important here?|You're in your living room.}
+[Watch TV] ->living_room.tv
+[Go into kitchen] ->kitchen
+[Go outside] ->yard
+[Go down to the basement] ->basement
+[Go to the hallway] ->hallway

=tv
{It's already on. It's glow captivates you. After some channel surfing, you notice your slippers on the floor! You must have been them there before you went to bed.|It's only static}
{not living_room.captivated && not slipper_pickup}*[Keep watching] ->living_room.captivated
*[Pick up slippers] ->living_room.slipper_pickup
+[Go back] ->living_room

=captivated
You flip to a program you've never seen before. 
You can't make out the images that flash across the screen, but they still unsettle you.
You can't look away.
+[Keep watching] ->endings.alternate_dimension
+[Go back] ->living_room

=slipper_pickup
You picked up your slippers and put them on.
+[Go back] ->living_room


== kitchen ==
{You enter the kitchen. There's a humble table with an old chair in the corner and barely functioning appliances shoved against the wall.| You're in your kitchen}
{bread_pickup} +[Make toast] ->kitchen.toaster_work
+[Check fridge] ->kitchen.fridge
+[Check cabinets] ->kitchen.cabinets
+[Go to the garage] ->garage
+[Go to the living room] ->living_room

=fridge
{You poke around in the fridge for a snack. You're not really in the mood for anything in there.|You still don't want anything in there.}
+[Go back] ->kitchen

=cabinets
You search through the cabinets and strike gold:
Bread.
Some toast would be delicious right now.
*[Take bread] ->bread_pickup
+[Go back] ->kitchen

=bread_pickup
You picked up the bread.
+[Go back] ->kitchen

=toaster_work
{
    -screwdriver_pickup:
        ->endings.midnight_snack
    -not screwdriver_pickup:
        ->kitchen.no_toaster
}

=no_toaster
You put some bread in the toaster and wait for it to become toast.








After several minutes of the bread not becoming toast, you realize you're toaster isn't working. If you had a screwdriver you might be able to tinker with it.
+[Go back] ->kitchen


== garage ==
You enter the garage. There isn't much in here. Just some lose tools and keys with no locks.
+[Search your toolbox] ->garage.toolbox
+[Search through your lose keys] ->garage.key_pile
+[Open the garage door] ->garage.door
+[Go up to the attic] ->attic.entry

=toolbox
{garage.screwdriver_pickup: You don't find anything useful.|You dig through a pile of rusted tools and find a screwdriver!}
*[Pick up screwdriver] ->garage.screwdriver_pickup
+[Go back] ->garage

=screwdriver_pickup
You picked up the screwdriver.
+[Go back] ->garage

=key_pile
{garage.car_key_pickup: You don't find anything useful.|You search through the pile of old keys and find your car keys! How'd those get there?}
*[Pick up car keys] ->garage.car_key_pickup
+[Go back] ->garage

=car_key_pickup
You picked up the car keys.
+[Go back] ->garage

=door
{You open the garage door. As it creeks open, you notice a green light outside that disappears as soon as you notice it.|You think you see the light again but it flickers away too soon.}
*[Go outside] ->endings.alien_abduction
+[Move on] ->garage


== attic ==
{You reached up with The Claw and pull down the string to the attic. You climb up the creaking ladder. It's full of dust and cardboard boxes.|You're in the your attic.}
+[Look out the window]
+[Search through boxes]
+[Go to the garage] ->garage

=entry
{
    - bedroom.claw_pickup:
        ->attic
    - not bedroom.claw_pickup:
        ->garage
}

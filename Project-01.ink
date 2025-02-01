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


VAR keys = 0


-> intro
== intro ==
It's 12am. You can't sleep. Your stomach grumbles. Maybe a snack would help you sleep?
+[Get up] -> bedroom
+[Stay in bed] ->endings.too_sleepy


== endings ==
=too_sleepy
You decide it's not worth it. The bed is so cozy all of a sudden and eating would give you too much energy anyway. 
.
Right?
.
.
Too Sleepy
Ending 1/7
->DONE

=alternate_dimension
The images flicker faster. You can't see anything else. You try to look away, but you're surrounded by a whirlwind of colors and shapes. 
You blink and suddenly everything goes dark.
You're back in your home but nothing is the same.
You're wallpaper is yellow. Everything is covered in dust. The windows are black.
Where are you?
.
.
Alternate Dimension
Ending 2/7
->DONE

=midnight_snack
You make some delicious toast and put your favorite topping on it. You're content enough to go back to sleep, but only content. 
.
.
Midnight Snack
Ending 3/7
->DONE

=alien_abduction
You walk outside to investigate but don't see anything out of the ordinary. All of a sudden, a bright green spotlight shines on her from above. You look up and see a giant metal disc above you and when you look down you see that you're floating several feet in the air. 
.
.
Alien Abduction
Ending 4/7
->DONE

=yippee
You got your egg fried rice and got home safe and sound! It was the best meal you've had in years! You slept soundly and woke up refreshed and relaxed the next morning! 
Yippee!
.
.
Yippee
Ending 5/7
->DONE

=you_died
No matter how much you try to fight back, the figure overtakes you. Its jaw opens even more and it devours you whole to the cheers of the shrouded people.
.
.
You Died
Ending 6/7
->DONE

=thanks_satan
You whip out the sacred text you got from your basement and flip to a bookmarked page. One of the passages is highlighted. As you chant, the figure starts to writhe in pain. You take the oppurtunity to plunge the dagger into its chest. The ash around you falls and seeps into the ground. The people in red are gone, you're alone with only ash. 
.
The town hails you as a hero. They reward you for your bravery with the key to the city, $1 trillion, and most importantly: a lifetime supply of egg fried rice from your favorite Thai place. You have the best sleep of your life that night and never need to venture out for a midnight snack again.
.
.
Thanks Satan
Ending 7/7
->DONE


== bedroom ==
{Begrudgingly, you get out of bed. Your messy bedroom surrounds you. Clothes are strewn across the floor as well as the remnants of previous midnight snacks.|You're in your bedroom}
+[Go into hallway] ->hallway
+[Check phone] ->phone.check_phone
+[Search closet] ->bedroom.closet
+[Search nightstand] ->bedroom.nightstand

=closet
{claw_pickup: You don't find anything useful.|You find a mechanical claw you got at a carnival a few years ago. It looks pretty cool.}
*[Pick up claw] ->bedroom.claw_pickup
+[Go back] ->bedroom

=claw_pickup
You pick up The Claw.
*[Go back] ->bedroom

=nightstand
{bedroom_key_pickup: You don't find anything useful.|You search your nightstand and find a golden key! You don't remember what it's for.}
*[Pick up the key] ->bedroom.bedroom_key_pickup
+[Go back] ->bedroom

=bedroom_key_pickup
~ keys = keys + 1
You picked up the key. You now have {keys} golden keys.
+[Go back] ->bedroom


== phone ==
=phone_charged
{
    - phone_on:
        ->phone_on
    - not phone_on:
        ->check_phone
}

=check_phone
{Drat! Your phone is dead. You must have forgotten to plug it in.|Still dead.}
*{car.phone_charger_pickup} [Plug in phone] ->phone_on
+[Go back] ->bedroom

=phone_on
Your phone starts charging and soon you're able to turn it on.
+[Browse local restaurants] ->menu
+[Go back] ->bedroom

=menu
You see that a local Thai place is still open. Some egg fried rice sounds really good right now. It's too far to walk, so you'll have to drive.
+[Go back] ->bedroom


== hallway ==
{You enter your hallway. Pictures line the wall. There's a door to your right and a room at the end of the hallway.|You're in your hallway.}
+[Continue down hallway] ->living_room
+[Go into the bathroom] ->bathroom.entry
+[Check window] ->hallway.hall_window
+[Go to the bedroom] ->bedroom

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
    -tv.slipper_pickup:
        ->bathroom
    -not tv.slipper_pickup:
        You can't walk on a tiled floor without your silppers! Your feet will get cold!
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
+[Watch TV] ->tv
+[Go into kitchen] ->kitchen
+[Go outside] ->yard.entry
+[Go down to the basement] ->basement.entry
+[Go to the hallway] ->hallway


== tv ==
{It's already on. It's glow captivates you. After some channel surfing, you notice your slippers on the floor! You must have been them there before you went to bed.|It's only static}
*{not captivated && not slipper_pickup}[Keep watching] ->tv.captivated
*[Pick up slippers] ->tv.slipper_pickup
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
+{bread_pickup} [Make toast] ->kitchen.toaster_work
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
    -garage.screwdriver_pickup:
        ->endings.midnight_snack
    -not garage.screwdriver_pickup:
        ->kitchen.no_toaster
}

=no_toaster
You put some bread in the toaster and wait for it to become toast.
.
.
.
.
.
.
.
.
After several minutes of the bread not becoming toast, you realize you're toaster isn't working. If you had a screwdriver you might be able to tinker with it.
+[Go back] ->kitchen


== garage ==
{You enter the garage. There isn't much in here. Just some lose tools and keys with no locks.|You're in your garage.}
+[Search your toolbox] ->garage.toolbox
+[Search through your lose keys] ->garage.key_pile
+[Open the garage door] ->garage.door
+[Go up to the attic] ->attic.entry
+[Go to the kitchen] ->kitchen

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
+[Look out the window] ->attic.window
+[Search through boxes] ->attic.boxes
+[Go to the garage] ->garage

=boxes
{not attic.dagger_pickup: You search through the boxes and find that one is full of your grandmother's old things that she gave to you before she passed. It's mostly full of old photos and trickets, but in a velvet case you find an ornate dagger.|You only find old photos and trinkets.}
*[Pick up the dagger] ->attic.dagger_pickup
+[Go back] ->attic

=dagger_pickup
You picked up the dagger.
+[Go back] ->attic

=window
{You peer out the large, round window. You see five trees lined up on the edge of your yard. Wait... you don't have trees in your yard.|You don't see anything.}
+[Go back] ->attic

=entry
{
    - bedroom.claw_pickup:
        ->attic
    - not bedroom.claw_pickup:
        You can't reach the strings to pull down the steps to the attic.
        ->garage
}


== basement ==
{You descend into your dark and dusty basement. You don't come down here often, so it's mostly empty. In the center of the room is a large wooden trunk you don't recognize.|You're in your basement.}
+{not sacred_text_pickup} [Open the trunk] ->basement.trunk
+[Go to the living room] ->living_room

=trunk
{keys == 3: You carefully insert the keys into the golden locks. The trunk creaks as it opens, inside is an old book written in language you don't understand.|The trunk is shut with three golden locks.}
*{keys == 3} [Pick up the book] ->sacred_text_pickup
+[Go back] ->basement

=sacred_text_pickup
You picked up the sacred text.
+[Go back] ->basement

=entry
{
    - yard.basement_key_pickup:
        ->basement
    - not yard.basement_key_pickup:
        The door is locked.
        ->living_room
}


== yard ==
{You walk outside intro your yard. The air is chill and crisp. You see your old beat-up card in the driveway. Out of the corner of your eye, you see a shadow move, but when you turn your head, you see somehting shiny on the ground.|You're in your yard.}
+[Get in car] ->car
+[Search the ground] -> yard.ground
+{phone.menu} [Walk to the restaurant] ->street
+[Go back inside] ->living_room

=ground
{basement_key_pickup: You don't find anything useful.|You search around and find the key to your basement! How'd it get out here?}
*[Pick up key] ->yard.basement_key_pickup
+[Go back] ->yard

=basement_key_pickup
You picked up the key.
+[Go back] ->yard

=entry
{
    - bathroom.pants_pickup:
        ->yard
    - not bathroom.pants_pickup:
        You can't go outside without any pants on! What if the neighbors see you?
        ->living_room
}


== car ==
{You get in your car. It was unlocked even though you don't have your keys. It's full of trash and the seats are peeling. You notice you left your phone charger in the passenger seat.|You're in your car.}
+{garage.car_key_pickup} [Drive away] ->drive
+[Search glovebox] ->glovebox
*[Pick up phone charger] ->phone_charger_pickup
+[Go back] ->yard

=phone_charger_pickup
You picked up the phone charger.
+[Go back] ->car

=drive
{
    - phone.menu: 
        ->endings.yippee
    - bedroom.not menu:
        You don't know where to go. ->car
}

=glovebox
{glovebox_key: You don't find anything useful.|You search through the glovebox and find a golden key!}
*[Pick up key] ->glovebox_key
+[Go back] ->car

=glovebox_key
~ keys = keys + 1
You picked up the key. You now have {keys} golden keys.
+[Go back] ->car


== street ==
{You decide the restaurant is THAT far. You start walking down the dark street.|You're on your street.}
+[Continue] ->kidnapping
+[Go back] ->yard

=kidnapping
You see someone dash through the trees.
+[Continue] ->cultists
+[Go back] ->seen_key

=seen_key
{
    -street_key_pickup:
        ->yard
    -not street_key_pickup:
        ->street_key
}

=street_key
As you turn back, you notice a golden key on the side of the road!
*[Pick up the key] ->street_key_pickup
+[Go to your yard] ->yard

=street_key_pickup
~ keys = keys + 1
You picked up the key. You now have {keys} golden keys.
+[Go to your yard] ->yard


== cultists ==
Suddenly, you hear footsteps running up behind you.
You feel a sharp pain in your head before everything goes black.
->sacrifice

=sacrifice
{You wake up in a large ornate room. Figures shrouded in red robes surround you. When you try to move you realize you're strapped upright to a large stone block. You watch as the figures set up a circle of candles around a pile of ash, chanting the whole time. When the last candle is lit, the whole room shakes. The ash spreads across the circle of candles and large hand reaches out. An imposing figure slowly climbs out of the ash and crawls toward you.|You struggle against you're restraints but can't escape.}
+[Fight back] ->sacrifice
+[Give in] ->satan

=satan
{The figure's legs emerge and it limps toward you. Its jaw hangs loose as it lets out unatural screams.|There's nothing you can do.}
+{attic.dagger_pickup} [Prepare your dagger] ->fight
+[Fight back] ->satan
+[Give in] ->endings.you_died

=fight
You're able to slip one of your hands out of the restraints. You pull your dagger out of your pocket and quickly cut the rest of your limbs free. The ash keeps spreading, surrounding you and the figure. It doesn't stop its march toward you.
+{basement.sacred_text_pickup} [Read from the sacred text] ->endings.thanks_satan
+[Fight back] ->fight
+[Give in] ->endings.you_died



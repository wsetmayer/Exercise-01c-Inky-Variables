/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR math_answer = 0
VAR mom_name = ""

-> memory

== memory ==
Before you enter the cave. You wish you had your childhood pet with you. What was that pet's name?

* [Charlie] 
    ~ pet_name = "Charlie"
    -> mom_mem

* [Susan] 
    ~ pet_name = "Susan"
    -> mom_mem

* [Spot] 
    ~ pet_name = "Spot"
    -> mom_mem
    
== mom_mem ==
You are about to enter the cave. You get a past memory of you and your mom. What was her name?

* [Sandy] 
    ~ mom_name = "Sandy"
    -> cave_mouth
    
* [Jean] 
    ~ mom_name = "Jean"
    -> cave_mouth


-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

{torches == 0: If only {pet_name} could see you!| {pet_name} can now see you!}





+ [Go East] -> east_tunnel
+ [Go West] -> west_tunnel
+ [Go North] -> north_tunnel
+ [Go South] -> south_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{ pet_name == "Spot": Spot would love it here in the west| }

+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room. { mom_name } would be proud.
-> END

=== north_tunnel ===
You are now in the north tunnel. It is pitch black.
*{torch_pickup}  [Light your torch] -> north_tunnel_lit
+ [Return to entrance] -> cave_mouth
-> END
=== south_tunnel ===
You are now in the south tunnel it is pitch black.
*{torch_pickup}  [Light your torch] -> south_tunnel_lit
+ [Return to entrance] -> cave_mouth
-> END

=== north_tunnel_lit ===
You can now see. There is wads of cash everywhere.
{ mom_name == "Jean": Jean wants you to pay her back now!| }
-> END
=== south_tunnel_lit ===
8+8 = ?

There is a math problem on the wall what is the answer to it.

* [16]
    ~ math_answer = 16
    -> right_answer

* [14]
    ~ math_answer = 14
    -> wrong_answer
-> END
=== west_tunnel_lit ===
You can now see, because of the light millions of bugs start crawling on you. You died
-> END

== wrong_answer ==
You answered incorrectly you have now died.

-> END
== right_answer ==
You answered correctly! Millions of dollars now overflow you.

-> END
# The 'Hit the Bricks' game

Hit_the_bricks is a reproduction of the old 'Brick Smash' for Windows 8 and 8.1. 

**Difficulty level:** Intermediate. 

**Programming language:** Java.

**How it works:** The bat is controlled by moving the mouse left or right. The player must catch the ball with the bat and destroy the wall of bricks. Sometimes, a brick must be hit multiple times in order to be destroyed. Some bricks may even release a snitch (a smaller yellow ball) after they have been destroyed. The game implements levels, lives and a session high scoring system. The player has 3 lives until death. A life is being lost when the ball goes behind the bat. The game resets when all lives are lost. The number of brick rows is direct proportional to that of the level and the maximum a player can reach is 8. Each destroyed brick adds to the score, with bricks that need to be hit multiple times having more points. If a snitch is caught by the bat, the score increases but so does the difficulty. If the score is higher than the established session high score as all lives are lost, it will be set as the new session high score.

**How it was built:** The program makes use of the OOP principles such that every object (i.e., brick, bat, ball) is an entity of a sparate class. To build the wall of bricks, a 2-D array list was used. 

> This exercise is written and animated using the Processing IDE. More information on inbuilt functions that have been used throughout the code can be found by accessing the [Processing Documentation](https://processing.org/reference/)

## Hit_the_bricks.pde
https://user-images.githubusercontent.com/60512873/122517374-cc1e2780-cfc4-11eb-96a7-2ec635c13cf7.mp4

https://user-images.githubusercontent.com/60512873/122517391-d04a4500-cfc4-11eb-8fe3-19cad934cf90.mp4



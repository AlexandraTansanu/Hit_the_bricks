import java.util.Random;

// board
final int WIDTH = 500;
final int HEIGHT = 500;

// bricks
int rows = 1;
final int BRICKW = WIDTH/10;
final int BRICKH = 20;

// ball
final int BALLINITX = 20;
final int BALLINITY = 200;

int lives;
int score;
int sessionScore = 0; // must be maintable throughout the whole game
boolean playing;

Ball myBall;
Bat myBat;
ArrayList <Brick> Bricks;
ArrayList <Snitch> Snitches;
HashMap <Brick,Snitch> Block; // identifies snitches after bricks


void settings() {
 size(WIDTH,HEIGHT); 
}

void setup() {
 frameRate(200);
 ellipseMode(CORNER);
 
 // create text font
 PFont f = createFont("Arial", 16, true);
 textFont(f,18);
 
 myBall = new Ball(BALLINITX,BALLINITY,30,127,127,127);
 myBat = new Bat(450,100,20,255,255,127);
 
 InitGame();
}

void InitGame() {
  if(!playing) {
    // initialize lives
    lives = 3; 
    
    // initialize score
    score = 0;
    
    // initialize level 
    rows = 1;
    
    // build wall of bricks with snitches 
    CreateBlock();

   // set playing to true
   playing = true;
  }
}

void CreateBlock() { // creates bricks and snitches 
    Bricks = new ArrayList<Brick>();
    Snitches = new ArrayList<Snitch>();
    Block = new HashMap<Brick,Snitch>();
    
    for(int row = 0; row < rows; row++) {
     for(int col = 0; col < WIDTH/BRICKW - 2; col++) {
       Brick b = new Brick((col + 1) * BRICKW, (row + 1) * BRICKH);
       Bricks.add(b);
      
       if(b.hasSnitch == true) { // if this brick has a snitch then add it
         Snitch s = new Snitch(b.x, b.y);
         Snitches.add(s);
         Block.put(b,s);
       }
       else {
        Block.put(b,null); 
       }
     }
    }
}

void drawBricks() { 
 for(int i = 0; i < Bricks.size(); i++) {
  Bricks.get(i).draw();
 }
}

void drawSnitches() {
  for(int i = 0; i < Snitches.size(); i++) {
    Snitches.get(i).draw();
    Snitches.get(i).move(myBat.y, myBat.w);
  }
}

void InitBall() {
  myBall.x = BALLINITX;
  myBall.y = BALLINITY;
  myBall.offsetX = 1;
  myBall.offsetY = 1;
}

void ResetLevel() {
  // increase level
  if(rows < 8) { 
    rows++;
  }
  
  // build wall of bricks with snitches 
  CreateBlock();
  
  // move ball back to start
  InitBall();
}

void draw() {
 if(playing) {
   // clear the background
   background(0);
   
   // draw the bricks and Snitches
   drawBricks();
   drawSnitches();
   
   // draw lives, level and score
   fill(255);
   text("Lives: " + lives, WIDTH - 80, HEIGHT - 10);
   text("Level: " + rows, WIDTH - 150, HEIGHT - 10);
   
   if(score > sessionScore) {
     fill(0,255,0);
     sessionScore = score;
   }
   else {
    fill(255); 
   }
   
   text("Score: " + score, WIDTH - 480, HEIGHT - 10);
 
   // move the ball
   if(myBall.move(myBat.y, myBat.w) == false) { // ball "died"
     lives--;
     
     if(lives == 0) { // lost all lives, so no longer playing
       fill(255,0,0);
       text("GAME OVER", WIDTH/2 - 55, HEIGHT/2);
       text("CLICK TO RESTART", WIDTH/2 - 85, HEIGHT/2 + 20);
       text("Session high score: " + sessionScore, WIDTH/2 - 85, HEIGHT/2 + 40);
       playing = false;
     }
     else { // move the ball back to start
       InitBall();
     }
   }
   
   // draw the ball
   myBall.draw();
 
   // draw the bat
   myBat.draw();
 }
}

void mouseClicked() {
   if(!playing) {
     // reset game
     InitGame();
     
     // move ball back to start
     InitBall();
   }
}

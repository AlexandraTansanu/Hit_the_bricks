class Brick {
  int x;
  int y;
  int r;
  int g;
  int b;
  int hits;
  boolean hasSnitch;
 
  Brick(int xpos, int ypos) {
    this.x = xpos;
    this.y = ypos;
    this.r = (int)random(256);
    this.g = (int)random(256);
    this.b = (int)random(256);
    this.hits = (int)random(1,4);
    this.hasSnitch = returnHasSnitch();
  }
  
  void draw() {
   strokeWeight(3);
   fill(this.r, this.g, this.b);
   
   // determine the outline of brick
   switch(this.hits) {
     case 4:
       stroke(#626060);
       break;
     case 3:
       stroke(#9B9999);
       break;
     case 2:
       stroke(#CECCCC);
       break;
     default:
       stroke(255);
   }
   
   rect(this.x, this.y, BRICKW, BRICKH);
  }
  
  boolean returnHasSnitch() { // determines whether or not a brick will have a snitch
    Random random = new Random(); 
    return random.nextBoolean();
  }
}

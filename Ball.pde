class Ball {
  int x;
  int y;
  int diam;
  int offsetX;
  int offsetY;
  int r;
  int g;
  int b;
 
  Ball(int xloc, int yloc, int d, int red, int green , int blue) {
    this.x = xloc;
    this.y = yloc;
    this.diam = d;
    this.offsetX = 1;
    this.offsetY  = 1;
    this.r = red;
    this.g = green;
    this.b = blue;
  }
  
  void draw() {
   strokeWeight(3);
   fill(this.r, this.g, this.b);
   stroke(255);
   ellipse(this.x, this.y, this.diam, this.diam);
  }
  
  boolean move(int batY, int batW) {
    // return true if the ball "ok", false if it's "lost"
   
     this.x += this.offsetX;
     this.y += this.offsetY;
     
   // detect loss 
   if(this.y > batY) // ball has gone beyond bat
     return (false);
 
   // detect the edges
     // right - left
     if(this.x > width - this.diam || x < this.diam/2)
       this.offsetX =- this.offsetX;
     else // top
     if(this.y < this.diam/2)
       this.offsetY =- this.offsetY;
     
     // check to see if in contact with bat
     if((this.x >= mouseX) && (this.x <= mouseX + batW) && (this.y > batY - this.diam))
       this.offsetY =- this.offsetY;
       
     // check all bricks
     for(int i = 0; i < Bricks.size(); i++) {
       Brick b = Bricks.get(i);
       
       if((this.x >= b.x) && (this.x <= b.x + BRICKW) && (this.y == b.y + BRICKH)) { // bottom of brick
         offsetY =- offsetY;
         BounceBrick(b);
       }
       else
       if((this.x >= b.x) && (this.x <= b.x + BRICKW) && (this.y == b.y)) { // top of brick
         offsetY =- offsetY;
         BounceBrick(b);
       }
       else
       if((this.y >= b.y) && (this.y <= b.y + BRICKH) && (this.x == b.x - this.diam)) { // left of brick
         offsetX =- offsetX;
         BounceBrick(b);
       }
       else 
       if((this.y >= b.y) && (this.y <= b.y + BRICKH) && (this.y == b.x + BRICKW)) { // right of brick
         offsetX =- offsetX;
         BounceBrick(b);
         
       }
       
      // check if all bricks are gone
     if(Bricks.isEmpty() == true) {
         ResetLevel();
       }
     }
   
     return (true);
  }
  
  void BounceBrick(Brick b) {
    // change the stroke of the brick or remove it and release snitch
    if(b.hits == 1) {
        Bricks.remove(b);
        
        if(Block.get(b) != null) { // if a snitch corresponds to the brick
          Block.get(b).live = true;
        }
    }
    else {
        b.hits--;
    }
    
    // increase score
    score += 10;
  }
}

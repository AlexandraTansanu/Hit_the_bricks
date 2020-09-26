class Snitch {
 int x;
 int y;
 boolean live;
  
 Snitch(int xpos, int ypos) {
   this.x = xpos;
   this.y = ypos;
   this.live = false;
 }
 
 void draw() {
   if(this.live == true) {
     strokeWeight(3);
     stroke(#FAF42B);
     fill(#FAF42B);
     ellipse(this.x, this.y, BRICKH, BRICKH);
   }
 }
 
 void move(int batY, int batW) {
   if(this.live == true) {
    // move the snitch
    this.y++; 
    
    // check to see if in contact with bat
     if((this.x >= mouseX) && (this.x <= mouseX + batW) && (this.y > batY - BRICKH)) {
       this.live = false;
       score += 500;
     }
   }
 }
}

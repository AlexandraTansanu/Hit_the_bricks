class Bat {
  int y;
  int w;
  int h;
  int r;
  int g;
  int b;
 
  Bat(int yloc, int width, int height, int red, int green, int blue) {
    this.y = yloc;
    this.w = width;
    this.h = height;
    this.r = red;
    this.g = green;
    this.b = blue;
  }
  
  void draw() {
   fill(this.r, this.g, this.b);
   stroke(this.r, this.g, this.b);
   rect(mouseX, this.y, this.w, this.h);
  }
}

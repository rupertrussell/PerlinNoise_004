// https://www.openprocessing.org/sketch/544740
// 2D Perlin noise - rotation by nsiddh3 
// fork by Rupert Russell 21 September 2020
// Code on Github at: PerlinNoise_004
// Artwork on Redbubble at: https://www.redbubble.com/shop/ap/57989779?ref=studio-promote

float xstart, xnoise, ynoise;
int scale = 20;
int margin = 40;

void setup() {
  noLoop();
  //  size(4535, 5480); // Wood & Canvas
  //size(1860,1860); // block
  // size(1600, 1600); // block
  // size(10000, 10000); // block
  // size(2280, 2760); // bag
  // size(3160, 2180); // bottle
  // size(6480, 4320); // Bath Mat
  // size(3502, 2385); // Journal
  size(800, 800); // 


  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y=margin; y<=height - margin; y+=scale) {
    ynoise+=0.1;
    xnoise = xstart;
    for (int x=margin; x<=width - margin; x+=scale) {  
      xnoise+=0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  // save("thumbnail.png");
  // println("saved noise-10000.png");
  // exit();
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(0, noiseFactor * 270);
  fill(0, noiseFactor * 270);
  strokeWeight(noiseFactor * 8);
  // line(0, 0, scale * 1.5 *  noiseFactor, 0);
  circle(0, 0, scale * 1.5 *  noiseFactor);
  popMatrix();
}

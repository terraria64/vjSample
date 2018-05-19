

class NowIts extends AppBase {
  
  int frames=30, num=400;
  float theta, sz=2;

  NowIts(PApplet _parent) {
    super(_parent);
  }
  
  @Override void setup() {

  }
  
  @Override void draw() {
    parent.background(bkg_b*5, bkg_b*7, bkg_b*6);
    
    float rad = in.mix.level() * rad_gain;
    
    radius = map(rad, 0, 0.5, 0, parent.width*2);

    
    for (int i = 0; i < in.bufferSize() - 1; i++) {

      float x1 = map(i, 0, in.bufferSize(), 0, width );
      float x2 = map(i+1, 0, in.bufferSize(), 0, width );
      float y1 = height / 2;
      //波形を描画
      stroke(255);
      strokeWeight(1);
      line( x1, y1 + in.mix.get(i) * osc1, x2, y1 + in.mix.get(i+1) * osc1);
      stroke(bkg_b * 10, bkg_b * 10, bkg_b * 10);
      strokeWeight(1);
      line( x1, y1 + in.mix.get(i) * osc2 * 1000, x2, y1 + in.mix.get(i+1) * osc2 * 1000);
      
      stroke(255, graph3_alpha/2);
      strokeWeight(in.mix.get(i) * 3000);
      line( x1, y1, x2, y1);
      
      stroke(255, graph3_alpha * 4);
      strokeWeight(in.mix.get(i) * 4000);
      line( x1, y1, x2, y1);

    }
    colorMode(RGB);
    fill(255, ellipse_green, ellipse_blue, ellipse_alpha);
    noStroke();
    ellipse(parent.width/2, parent.height/4, radius, radius);
    
    
  }
  
} 

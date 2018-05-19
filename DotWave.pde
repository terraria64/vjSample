class DotWave extends AppBase {
  
  float theta;
  float amplitude;
  int numberOfWaves = 12;
  int num = 12, frames = 5000;
  float elp_theta;
  
 
  DotWave(PApplet _parent){
    super(_parent);
  }
  
  @Override void setup() {
    size(parent.width, parent.height);
    noStroke();
  }
  
  @Override void draw(){
   
    background(0);
    
    
    for (int i=0; i< numberOfWaves; i++) {
      drawWave(i);
      drawCircle(i);
    }
    
    
    theta += 0.04;
    elp_theta += TWO_PI/frames;
    
  }
  
  void drawWave(int i) {
    randomSeed(123);
    for (int x=0; x<=parent.width; x+=10) {
      noStroke();
      amplitude = map(i, 0, numberOfWaves-1, 1, 100);
      float offSet = TWO_PI/parent.width*x;
      float y = parent.height/2 + sin(theta+offSet)*amplitude;
      if (w_color_flg == false){
        fill(random(255)/numberOfWaves*i,random(255)/numberOfWaves*i,random(255)/numberOfWaves*i, wave_alpha);
      } else {
        fill(wave_alpha, wave_alpha);
      }
      ellipse(x, y, 4, 4);
    }
  }
  
  void drawCircle(int i) {
   float offSet = TWO_PI/num*i;
    float sz = map(sin(elp_theta+offSet), -1, 1, 5, width/2);
    stroke(255, circle_color);
    
    
    strokeWeight(1+in.mix.level()*circle_gain);
    if (i%3==0) {
      fill(0, 0, 0, 50);
    } else {
      noFill();
    }
    ellipse(width/2, height/2, sz, sz); 
  }
  
}

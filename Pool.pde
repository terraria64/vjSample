

class Pool extends AppBase {
  
  color col1=#409D91, col2=#FFE9B3;
  int columns = 20;
  float stepX, theta, ot, fc, scal=1;
  float[] offSets = new float[columns];
  float[] offTheta = new float[columns];
  boolean save = false;

  Pool(PApplet _parent) {
    super(_parent);
  }
  
  @Override void setup() {
    size(parent.width, parent.height);
    stepX = width/columns;
    strokeWeight(stepX+1);
  
    for (int i=0; i<columns; i++) {
      offSets[i]=random(20,50);
      offTheta[i]= ot;
      ot += TWO_PI/columns;
    }
  
    drawWaves();
  }

  @Override void draw() {
    colorMode(RGB);
    background(0);
    
    drawWaves();
    
    
    float rad = in.mix.level() * rad_gain * 10;
    
    radius = map(rad, 0, 0.5, 0, parent.width*2);

    colorMode(RGB);
    noStroke();
    fill(240, 50, 50, ellipse_alpha);
    ellipse(parent.width/2, parent.height/2, radius, radius);
    
   
    theta -= 0.0523;
  }
  
  
void drawWaves() {
  noFill();
  for (int i=0; i<columns; i++) {
    
    scal = map(sin(theta+offTheta[i]), -1, 1, 0.5, 1.5);
    float x=stepX*(i+.5);
    if (i%2==0) {
      float y = height/2 - offSets[i]*scal;
      stroke(132, 169, 153, p_alph);
      line(x, 0, x, y);
      stroke(255, 233, 179, p_alph_2);
      line(x, y, x, height);
    } 
    else {
      float y = height/2 + offSets[i]*scal;
      stroke(255, 233, 179, p_alph_2);
      line(x, y, x, height); 
      stroke(132, 169, 153, p_alph);
      line(x, 0, x, y);
    }
  }
}
  
} 

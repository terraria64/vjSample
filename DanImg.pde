class DanImg extends AppBase {
  
  PImage img;
  PImage img_noise;
  PImage img_random;
  
  DanImg(PApplet _parent){
    super(_parent);
  }
  
  @Override void setup() {
    size(parent.width, parent.height);
    img = loadImage("dn.jpg");
    img_noise = loadImage("dn_n.jpg");
  }
  
  @Override void draw() {
    background(0);
    

    float seed = random(1);
  
    if (seed < 0.3) {
      image(img_noise, 0, 0, parent.width, parent.height);
    } else {
      image(img, 0, 0, parent.width, parent.height);
    }
    
    tint(255, dn_alpha);
  
  }
    
}

class DanImg extends AppBase {
  
  DanImg(PApplet _parent){
    super(_parent);
  }
  
  @Override void setup() {
    size(parent.width, parent.height);
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

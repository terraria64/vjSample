import ddf.minim.*;
import ddf.minim.analysis.*;
import netP5.*;
import oscP5.*;


ArrayList<AppBase>apps;
int selected;

// for DanImg
float dn_alpha = 0;

// for GraphVisualizer
float osc1 = 0;
float osc2 = 0;
float radius;
float ellipse_alpha = 0;
float ellipse_green = 0;
float ellipse_blue = 0;
float graph2_alpha = 0;
float graph3_alpha = 0;
float graph2_weight = 1;
float graph3_weight = 1;
float bkg_b = 0;

// for GrayEye

float bkg = 0;

Minim minim;
AudioInput in;
OscP5 oscP5, oscP52;
FFT fft;

void setup() {
  size(displayWidth,displayHeight, P3D);
  colorMode(HSB,360,100,100);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  oscP5 = new OscP5(this, 9000);
    
  apps = new ArrayList<AppBase>();
  apps.add(new DanImg(this));
  apps.add(new GraphVisualizer(this));
  apps.add(new GrayEye(this));
  
  for(AppBase app:apps){
    app.setup();
  }
  selected = 0;
}
void draw() {
  apps.get(selected).update();
  apps.get(selected).draw();
}
void keyPressed(){
  if(key == '0'){
    selected = 0;
  }
  if(key == '1'){
    selected = 1;
  }
  if(key == '2'){
    selected = 2;
  }
}

void oscEvent(OscMessage theOscMessage) {
    
  String addr = theOscMessage.addrPattern();
  float val0 = theOscMessage.get(0).floatValue();
   
  println(addr);
    
  if(addr.equals("/1/fader1")){ 
    //println("FADER 1"); 
    osc1 = val0*1000;
  
  } else if (addr.equals("/1/fader2")) {
    osc2 = val0*1000;
  
  } else if (addr.equals("/1/fader3")) {
    float alpha = map(val0, 0, 1, 0, 255);
    ellipse_alpha = alpha;
  
  } else if (addr.equals("/1/fader4")) {
    float green = map(val0, 0, 1, 0, 255);
    ellipse_green = green;
    
  } else if (addr.equals("/1/fader5")) {
    float alpha1 = map(val0, 0, 1, 0, 100);
    float alpha2 = map(val0, 0, 1, 0, 50);
    graph2_alpha = alpha1;
    graph3_alpha = alpha2;
  } else if (addr.equals("/1/rotary2")) {
    float blue = map(val0, 0, 1, 0, 10);
    bkg_b = blue;
  } else if (addr.equals("/1/rotary3")) {
    float dn_alp = map(val0, 0, 1, 0, 255);
    dn_alpha = dn_alp;
  }
}

import ddf.minim.*;
import netP5.*;
import oscP5.*;

class GraphVisualizer extends AppBase {
  
  float osc1 = 0;
  float osc2 = 0;
  float radius;
  float ellipse_r = 0;
  
  Minim minim;
  AudioInput in;
  OscP5 oscP5;
  
  GraphVisualizer(PApplet _parent) {
    super(_parent);
  }
  
  @Override void setup() {
    minim = new Minim(this);
    in = minim.getLineIn(Minim.MONO, 512);
    oscP5 = new OscP5(this, 9000);
  }
  
  @Override void draw() {
    parent.background(0);
    parent.stroke(255);
    
    radius = map(in.mix.level(), 0, 0.5, 0, parent.width*2);
    
    for (int i = 0; i < in.bufferSize() - 1; i++) {

      float x1 = map(i, 0, in.bufferSize(), 0, width );
      float x2 = map(i+1, 0, in.bufferSize(), 0, width );
      float y1 = height / 2;
      //波形を描画
      line( x1, y1 + in.left.get(i) * osc1, x2, y1 + in.left.get(i+1) * osc2);

    }
    colorMode(RGB);
    fill(ellipse_r, 0, 0);
    noStroke();
    ellipse(parent.width/2, parent.height/4, radius, radius);
    ellipse(parent.width/2, (parent.height/4)*3, radius*2, radius*2);
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
    
    } else if (addr.equals("/1/push11")) {
      ellipse_r = 255;
    } else if (addr.equals("/1/push12")) {
      ellipse_r = 0;
    }
  }
} 
 

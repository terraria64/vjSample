import ddf.minim.*;
import ddf.minim.analysis.*;
import netP5.*;
import oscP5.*;

class GraphVisualizer extends AppBase {
  
  float osc1 = 0;
  float osc2 = 0;
  float radius;
  float ellipse_alpha = 0;
  float ellipse_green = 0;
  float ellipse_blue = 0;

  Minim minim;
  AudioInput in;
  OscP5 oscP5;
  FFT fft;
  
  GraphVisualizer(PApplet _parent) {
    super(_parent);
  }
  
  @Override void setup() {
    minim = new Minim(this);
    in = minim.getLineIn(Minim.STEREO, 512);
    oscP5 = new OscP5(this, 9000);

  }
  
  @Override void draw() {
    parent.background(0);
    
    radius = map(in.mix.level(), 0, 0.5, 0, parent.width*2);

    
    for (int i = 0; i < in.bufferSize() - 1; i++) {

      float x1 = map(i, 0, in.bufferSize(), 0, width );
      float x2 = map(i+1, 0, in.bufferSize(), 0, width );
      float y1 = height / 2;
      //波形を描画
      stroke(255);
      strokeWeight(1);
      line( x1, y1 + in.mix.get(i) * osc1, x2, y1 + in.mix.get(i+1) * osc1);
      stroke(0);
      strokeWeight(1);
      line( x1, y1 + in.mix.get(i) * osc2 * 1000, x2, y1 + in.mix.get(i+1) * osc2 * 1000);

    }
    colorMode(RGB);
    fill(255, ellipse_green, ellipse_blue, ellipse_alpha);
    noStroke();
    ellipse(parent.width/2, parent.height/4, radius, radius);
    
    
    
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
      
    } else if (addr.equals("/1/push11")) {
    }
  }
} 
 

import ddf.minim.*;
import netP5.*;
import oscP5.*;

class GraphVisualizer extends AppBase {
  
  float osc1 = 0;
  float osc2 = 0;
  
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
    
    //volumeIn = map(in.left.level(), 0, 0.5, 0, width*2);
    
    for (int i = 0; i < in.bufferSize() - 1; i++) {

      float x1 = map(i, 0, in.bufferSize(), 0, width );
      float x2 = map(i+1, 0, in.bufferSize(), 0, width );
      float y1 = height / 2;
      //波形を描画
      line( x1, y1 + in.left.get(i) * osc1, x2, y1 + in.left.get(i+1) * osc2);

    }
  }
  
  void oscEvent(OscMessage theOscMessage) {
 
  println("touch osc"+theOscMessage);
  osc1 = theOscMessage.get(0).floatValue()*1000;
  osc2 = theOscMessage.get(1).floatValue()*1000;
 
  println(osc1+", "+osc2);
  }

}



class Pool extends AppBase {

  Pool(PApplet _parent) {
    super(_parent);
  }
  
  @Override void setup() {
    noFill();
  strokeJoin(ROUND);
  points = new PVector[int(360/angle)+1];
  // Make points.
  for (int i = 0; i < 360; i+=angle) {
    int angleToIndex = int(i/angle);
    points[angleToIndex] = new PVector(width/2+sin(radians(i+180))*shapeSize, height/2+cos(radians(i+180))*shapeSize);
  }
  }

  @Override void draw() {
    background(30);
  if (particles.size() < 40 && (frameCount%=3)==0) particles.add(new Particle(90));
  stroke(170, 40, 75);
  strokeWeight(10);
  beginShape();
  for(int i = 0; i < int(360/angle); i++){
    vertex(points[i].x, points[i].y); 
  }
  endShape(CLOSE);
  stroke(30);
  strokeWeight(5);
  beginShape();
  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    vertex(p.loc.x, p.loc.y);
    p.move();
  }
  endShape();
  
  
  for (int i = 0; i < in.bufferSize() - 1; i++) {

      float x1 = map(i, 0, in.bufferSize(), 0, width );
      float x2 = map(i+1, 0, in.bufferSize(), 0, width );
      float y1 = height / 2;
      stroke(255);
      strokeWeight(1);
      line( x1, y1 + in.mix.get(i) * osc1, x2, y1 + in.mix.get(i+1) * osc1);
      stroke(0, 0, 10);
      strokeWeight(1);
      line( x1, y1 + in.mix.get(i) * osc2 * 1000, x2, y1 + in.mix.get(i+1) * osc2 * 1000);
      
      stroke(255, 0);
      strokeWeight(in.mix.get(i) * 3000);
      line( x1, y1, x2, y1);
      
      stroke(255, graph3_alpha);
      strokeWeight(in.mix.get(i) * 4000);
      line( x1, y1, x2, y1);
  }
  }
    
  
  

  
} 
class Particle {
  PVector loc, vel, nextLoc;
  int speed, index;

  Particle(float s) {
    speed = 2;
    index = 0;
    
    loc = points[index].get();
    nextLoc = loc.get();
    changeVelocity(nextLoc);
  }

  void move() {
    if (PVector.dist(loc, nextLoc) < speed) {
      nextLoc = points[int(index++%(360/angle))];
      changeVelocity(nextLoc);
    }
    loc.add(vel); 
  }

  void changeVelocity(PVector l) {
    vel = new PVector(l.x-loc.x, l.y-loc.y);
    vel.normalize();
    vel.mult(speed);
  }
}

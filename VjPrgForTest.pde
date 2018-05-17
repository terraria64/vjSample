ArrayList<AppBase>apps;
int selected;

void setup() {
  size(displayWidth,displayHeight, P2D);
  colorMode(HSB,360,100,100);
  
  apps = new ArrayList<AppBase>();
  apps.add(new GraphVisualizer(this));
  apps.add(new BlueSquare(this));
  
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
}

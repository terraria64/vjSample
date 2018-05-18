abstract class AppBase {

  protected PApplet parent;
  public AppBase(PApplet _parent) {
    parent = _parent;
  }
  public void setup() {
  }
  public void update() {
    //抽象クラスなので何も書かない
  }
  public void draw() {
  }
  
}

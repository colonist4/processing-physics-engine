class Stick{
  Particle p1, p2;
  float length;
  Stick(Particle p1, Particle p2, float l){
    this.p1 = p1;
    this.p2 = p2;
    length = l;
  }
  
  void constrain(){
    PVector d = PVector.sub(p1.position, p2.position);
    float dist = d.mag();
    float percent = (dist - length)/dist;
    d.mult(percent/2);
    p1.position.sub(d);
    p2.position.add(d);
  }
  
  void draw(){
    line(p1.position.x, p1.position.y, p2.position.x, p2.position.y);
  }
}

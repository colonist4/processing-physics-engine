class Spring extends ForceGenerator{
  final static float damperK = 0.03;
  Body b1, b2;
  float k, len;
  Spring(Body b1, Body b2, float k, float len){
    this.b1 = b1;
    this.b2 = b2;
    this.k = k;
    this.len = len;
  }
  void applyForce(){
    force = PVector.sub(b2.position, b1.position);
    float mag = force.mag();
    mag -= len;
    force.normalize();
    
    //float rel = PVector.sub(b2.velocity, b1.velocity).dot(force);
    //rel *= damperK;
    //PVector damp = PVector.mult(force, rel);
    
    //force.mult(mag*k);
    //force.add(damp);
    
    PVector rel = PVector.sub(b1.velocity, b2.velocity);
    rel.mult(damperK);
    force.mult(mag*k);
    force.sub(rel);
    
    b1.applyForce(force);
    b2.applyForce(force.mult(-1));
    
    //b1.velocity.mult(0.999);
    //b2.velocity.mult(0.999);
  }
  void draw(){
    if(visible){
      float mag = force.mag();
      if(mag < len)
        stroke(0, 0, 255);
      else
        stroke(255, 0, 0);
      strokeWeight(1);
      
      line(b1.position.x, b1.position.y, b2.position.x, b2.position.y);
    }
  }
}

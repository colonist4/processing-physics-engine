class Body{
  PVector position, velocity, force;
  float invMass, mass;
  void draw(){}
  void applyForce(PVector f){ force.add(f); }
  void update(float dt){
    velocity.add(force.mult(dt*invMass));
    position.add(PVector.mult(velocity, dt));
    force.set(0, 0);
  }
  boolean isInside(PVector point){return false;}
  
  void side(){
    if(position.x > width || position.x < 0) {
      velocity.x *= -1;
      position.x = constrain(position.x, 0, width);
    }
    if(position.y > height || position.y < 0) {
      velocity.y *= -1;
      position.y = constrain(position.y, 0, height);
    }
  }
}

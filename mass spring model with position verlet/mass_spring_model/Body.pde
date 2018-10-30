class Body{
  PVector position, velocity, force, prevPosition;
  float invMass, mass, vy;
  void draw(){}
  void applyForce(PVector f){ force.add(f); }
  void update(float dt){
    
    prevPosition = position.copy();
    
    velocity.add(force.mult(dt*invMass));
    
    position.mult(2);
    position.sub(prevPosition);
    position.add(force.mult(dt));
    
    side();
    force.set(0, 0);
  }
  boolean isInside(PVector point){return false;}
  
  boolean side(){
    if(position.x > width) {
      velocity.x *= -1;
      position.x = width;
      
      prevPosition.x = 2*width - prevPosition.x;
      return true;
    }
    else if(position.x < 0){
      velocity.x *= -1;
      position.x = 0;
      prevPosition.x = -prevPosition.x;
      return true;
    }
    if(position.y > height) {
      velocity.y *= -1;
      float dy = position.y - prevPosition.y;
      position.y = height;
      prevPosition.y = position.y + dy;
      return true;
    }
    else if(position.y < 0){
      velocity.y *= -1;
      position.y = 0;
      prevPosition.y = -prevPosition.y;
      return true;
    }
    return false;
  }
}

class Particle{
  PVector positionOld, position, force;
  float invMass, mass;
  Particle(float x, float y, float mass){
    position = new PVector(x, y);
    positionOld = position.copy();
    force = new PVector(0, 0);
    if(mass != -1)
      invMass = 1 / mass;
    else
      invMass = 0;
    
  }
  
  void step(float dt){
    PVector vel = PVector.sub(position, positionOld);
    positionOld = position.copy();
    
    position.add(vel);
    position.add(force.mult(invMass*dt*dt/2));
    force.set(0, 0);
    
    border();
  }
  
  void applyForce(PVector f){
    force.add(f);
  }
  
  void border(){
    if(position.y > height){
      float dy = position.y - positionOld.y;
      position.y = height;
      positionOld.y = height + dy;
    }
    else if(position.y < 0){
      float dy = position.y - positionOld.y;
      position.y = 0;
      positionOld.y = dy;
    }
    
    if(position.x > width){
      float dx = position.x - positionOld.x;
      position.x = width;
      positionOld.x = width + dx;
    }
    else if(position.x < 0){
      float dx = position.x - positionOld.x;
      position.x = 0;
      positionOld.x = dx;
    }
  }
  
  void draw(){
    pushMatrix();
    translate(position.x, position.y);
    ellipse(0, 0, 10, 10);
    
    popMatrix();
  }
}

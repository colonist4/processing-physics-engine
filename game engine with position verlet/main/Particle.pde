class Particle{
  PVector prevPosition, position, force;
  float invMass;
  Particle(float x, float y, float mass){
    
    position = new PVector(x, y);
    prevPosition = new PVector(x, y);
    force = new PVector(0, 0);
    
    if(mass == -1) invMass = 0;
  }
  
  void update(float dt){
    force.mult(invMass*dt*dt);
    
    PVector nextPosition = PVector.add(position, PVector.sub(position, prevPosition));
    nextPosition.add(force);
    
    prevPosition = position;
    position = nextPosition;
    force.set(0, 0);
  }
  void draw(){
    pushMatrix();
    translate(position.x, position.y);
    fill(255);
    noStroke();
    ellipse(0,0,5,5);
    
    popMatrix();
  }
}

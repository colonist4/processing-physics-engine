class Particle extends Body{
  float radius;
  Particle(float x, float y, float mass, float r){
    radius = r;
    position = new PVector(x, y);
    prevPosition = new PVector(x, y);
    force = new PVector(0, 0);
    velocity = new PVector(0, 0);
    
    if(mass == -1) invMass = 0;
    else invMass = 1/mass;
  }
  
  void applyForce(PVector f){
    force.add(f);
  }
  
  void screenBound(){
    float damping = 0.9;
    if(position.x + radius >= width){
      position.x = width - radius;
      prevPosition.x = position.x + velocity.x * damping;
    }
    if(position.x - radius <= 0){
      position.x = radius;
      prevPosition.x = position.x - velocity.x * damping;
    }
    if(position.y + radius >= height){
      position.y = height - radius;
      prevPosition.y = position.y + velocity.y * damping;
    }
  }
  void inertia(float dt){
    velocity = PVector.sub(position, prevPosition).mult(damping);
    PVector nextPosition = PVector.add(position, velocity);
    
    prevPosition = position;
    position = nextPosition;
  }
  void accelerate(float dt){
    force.mult(invMass*dt*dt);
    position.add(force);
    force.set(0, 0);
  }
  
  void update(float dt){
    force.mult(invMass*dt*dt);
    velocity = PVector.sub(position, prevPosition).mult(damping);
    PVector nextPosition = PVector.add(position, velocity);
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
    ellipse(0,0,2*radius,2*radius);
    
    popMatrix();
  }
}

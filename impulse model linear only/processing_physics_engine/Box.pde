class Box extends Body{
  PVector size;
  float rotation;
  
  Box(PVector pos, PVector s, float mass){
    position = pos.copy();
    size = s.copy();
    
    init(mass);
  }
  
  Box(PVector pos, float w, float h, float mass){
    position = pos.copy();
    size = new PVector(w, h);
    
    init(mass);
  }
  
  private void init(float mass){
    if(mass == -1) invMass = 0;
    else invMass = 1/mass;
    
    velocity = new PVector(0, 0);
    force = new PVector(0, 0);
    impulse = new PVector(0, 0);
    
    type = Body.RECT;
  }
  
  void draw(){
    pushMatrix();
    translate(position.x, position.y);
    rectMode(CENTER);
    noFill();
    if(isCollide)
      stroke(255, 0, 0);
    else
      stroke(0);
    //fill(0);
    //noStroke();
    rect(0, 0, size.x, size.y);
    
    //
    stroke(255, 0, 0);
    line(0, 0, velocity.x, velocity.y);
    //
    
    popMatrix();
    
    isCollide = false;
    
    velocity.mult(0.99);
  }
  void applyForce(PVector f){
    force.add(f);
  }
  void toWorldCoord(PVector v){
    v.add(position);
  }
}

class Circle extends Body{
  float size;
  Circle(PVector position, float size, float mass){
    this.position = position.copy();
    this.size = size;
    this.mass = mass;
    if(mass == -1)
      this.invMass = 0;
    else
      this.invMass = 1/mass;
    
    velocity = new PVector(0, 0);
    force = new PVector(0, 0);
  }
  
  void draw(){
    pushMatrix();
    translate(position.x, position.y);
    fill(0);
    noStroke();
    ellipse(0, 0, size, size);
    popMatrix();
  }
  
  boolean isInside(PVector point){
    float dist = PVector.sub(point, position).magSq();
    return 4*dist < 5 * 5;
  }
  
  
}

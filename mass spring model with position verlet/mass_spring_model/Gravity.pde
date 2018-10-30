class Gravity extends ForceGenerator{
  Body b1;
  PVector g;
  Gravity(Body b1){
    this.b1 = b1;
    g = new PVector(0, 20.0f / b1.invMass);
  }
  void applyForce(){
    b1.applyForce(g);
  }
}

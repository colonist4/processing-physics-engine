class DistanceConstraint implements Constraint{
  Particle A, B;
  float restLength;
  DistanceConstraint(Particle A, Particle B, float l){
    this.A = A;
    this.B = B;
    this.restLength = l;
  }
  
  void solve(){
    // dist vector point to A from B
    PVector dist = PVector.sub(A.position, B.position);
    float diff = restLength - dist.mag();
    dist.normalize();
    dist.mult(diff/2);
    
    A.position.add(dist);
    B.position.sub(dist);
  }
}

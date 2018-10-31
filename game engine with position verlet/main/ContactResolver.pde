class ContactResolver{
  ArrayList<Contact> contacts;
  float e = 0.5;
  
  ContactResolver(){
    contacts = new ArrayList<Contact>();
  }
  
  void reset(){
    contacts.clear();
  }
  
  void solve(boolean preserve_impulse){
    for(Contact c : contacts){
      switch(c.type){
        case Contact.Particle_Particle:
          ppaSolve(preserve_impulse, c);
        break;
      }
      
    }
  }
  
  // Particle - Particle Solver
  void ppaSolve(boolean preserve_impulse, Contact c){
    Particle A = c.A.vertices.get(0);
    Particle B = c.B.vertices.get(0);
    
    float massA = c.A.invMass;
    float massB = c.B.invMass;
    
    float vRel = PVector.sub(A.velocity, B.velocity).dot(c.collisionVector);
    PVector momentum = PVector.mult(c.collisionVector,-(e+1)*vRel/(massA+massB));
    
    c.collisionVector.mult(c.p_depth/2);
    A.position.add(c.collisionVector);
    B.position.sub(c.collisionVector);
    
    if(preserve_impulse){
      A.velocity.add(PVector.mult(momentum, massA));
      B.velocity.add(PVector.mult(momentum, -massB));
      
      A.prevPosition = PVector.sub(A.position, A.velocity);
      B.prevPosition = PVector.sub(B.position, B.velocity);
    }
  }
}

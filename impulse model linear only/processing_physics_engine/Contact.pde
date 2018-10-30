class Contact{
  final static float biasFactor = 0.3, k_allowedPenetration = 0.5;
  
  Body b1, b2;
  PVector normal;
  float penetrationDepth;
  float massNormal;
  
  Contact(Body b1, Body b2, float d, PVector n){
    this.b1 = b1;
    this.b2 = b2;
    penetrationDepth = d;
    normal = n.copy();
  }
  
  void applyImpulse(float inv_dt){
    massNormal = 1.0f / (b1.invMass + b2.invMass);
    // When more penetrated than allowed penetration, apply bias velocity 
    float bias = -biasFactor * inv_dt * Math.min(penetrationDepth + k_allowedPenetration, 0);
    //float bias = 0;
    
    PVector rel = PVector.sub(b2.velocity, b1.velocity);
    float vn = PVector.dot(rel, normal);
    float dPn = massNormal * (-vn + bias);
    // Just apply impulse along normal vector.
    dPn = Math.max(dPn, 0);
    
    PVector Pn = PVector.mult(normal, dPn);
    
    // Normal vector direction is from b1 to b2
    // So Pn is too.
    // So impulse must sub from b1
    // and add to b2
    b1.velocity.sub(PVector.mult(Pn, b1.invMass));
    b2.velocity.add(PVector.mult(Pn, b2.invMass));
  }
}

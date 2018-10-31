class CollisionDetector{
  Contact circleToCircle(Composite c1, Composite c2){
    if(c1.type != Composite.Particle || c2.type != Composite.Particle) return null; 
    
    Particle A = c1.vertices.get(0);
    Particle B = c2.vertices.get(0);
    PVector dist = PVector.sub(A.position, B.position);
    if(dist.magSq() <= (A.radius + B.radius)*(A.radius + B.radius)){
      Contact c = new Contact();
      c.type = Contact.Particle_Particle;
      
      c.A = c1;
      c.B = c2;
      c.p_depth = (A.radius + B.radius) - dist.mag();
      c.collisionVector = dist.normalize();
      
      return c;
    }
    
    return null;
  }
  
  Contact polygonToPolygon(Composite A, Composite B){
    if(A.type != Composite.Polygon || B.type != Composite.Polygon) return null; 
    
    Contact c = new Contact();
    
    int l1 = A.vertices.size();
    int l2 = B.vertices.size();
    int l = l1 + l2;
    for(int i=0; i<l; i++){
      Edge e = new Edge();
      if(l < l1){
        e.parent = A;
        e.from = A.vertices.get(i);
        e.to = A.vertices.get((i+1)%l1);
      } else{
        e.parent = B;
        e.from = B.vertices.get(i-l1);
        e.to = B.vertices.get((i-l1+1)%l2);
      }
      
      e.e = PVector.sub(e.to.position, e.from.position);
      
      PVector n = new PVector(-e.e.y, e.e.x);
      float maxA, maxB, minA, minB;
      int maxAIdx=0, maxBIdx=0, minAIdx=0, minBIdx=0;
      maxA = minA = PVector.dot(A.vertices.get(0).position, n);
      maxB = minB = PVector.dot(B.vertices.get(0).position, n);
      
      for(int j=1; j<l1; j++){
        float temp = PVector.dot(A.vertices.get(j).position, n);
        if(temp > maxA) {maxA = temp; maxAIdx = j;}
        if(temp < minA) {minA = temp; minAIdx = j;}
      }
      for(int j=1; j<l2; j++){
        float temp = PVector.dot(B.vertices.get(j).position, n);
        if(temp > maxB) {maxB = temp; maxBIdx = j;}
        if(temp < minB) {minB = temp; minBIdx = j;}
      }
      
      // Collision
      if(minA <= maxB && maxA >= minB){
        
      } else{
        return null;
      }
    }
    
    return null;
  }
}

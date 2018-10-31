class CompositeGenerator{
  Composite makeSquare(float cx, float cy, float w, float h){
    float d = sqrt(w*w+h*h);
    w /= 2;
    h /= 2;
    
    Composite c = new Composite(Composite.Polygon);
    
    Particle lu = new Particle(cx-w, cy-h, 1, 0.5);
    Particle ld = new Particle(cx-w, cy+h, 1, 0.5);
    Particle rd = new Particle(cx+w, cy+h, 1, 0.5);
    Particle ru = new Particle(cx+w, cy-h, 1, 0.5);
    
    c.invMass = 1/4;
    
    c.vertices.add(lu);
    c.vertices.add(ld);
    c.vertices.add(rd);
    c.vertices.add(ru);
    
    c.constraints.add(new DistanceConstraint(lu, ld, 2*h));
    c.constraints.add(new DistanceConstraint(ld, rd, 2*w));
    c.constraints.add(new DistanceConstraint(rd, ru, 2*h));
    c.constraints.add(new DistanceConstraint(ru, lu, 2*w));
    c.constraints.add(new DistanceConstraint(ru, ld, d));
    c.constraints.add(new DistanceConstraint(rd, lu, d));
    
    return c;
  }
  
  Composite makeParticle(float x, float y){
    Composite c = new Composite(Composite.Particle);
    
    c.vertices.add(new Particle(x, y, 1, 5));
    c.invMass = 1;
    return c;
  }
}

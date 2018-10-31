class Composite{
  static final int Particle = 0;
  static final int Circle = 1;
  static final int Polygon = 2;
  
  ArrayList<Particle> vertices;
  ArrayList<Constraint> constraints;
  int type;
  float invMass;
  
  Composite(int type){
    vertices = new ArrayList<Particle>();
    constraints = new ArrayList<Constraint>();
    this.type = type;
  }
  
  void solve(){
    for(Constraint c: constraints)
      c.solve();
  }
  
  void applyForce(PVector f){
    for(Particle p : vertices)
      p.applyForce(f);
  }
  
  void screenBound(){
    for(Particle p : vertices){
      p.screenBound();
    }
  }
  
  void accelerate(float dt){
     for(Particle p : vertices){
      p.inertia(dt);
    }
  }
  
  void inertia(float dt){
    for(Particle p : vertices){
      p.accelerate(dt);
    }
  }
  
  void draw(){
    fill(255);
    switch(type){
    case Polygon:
      beginShape();
      for(Particle p:vertices)
        vertex(p.position.x, p.position.y);
      endShape(CLOSE);
    break;
    case Particle:
      for(Particle p : vertices)
        p.draw();
    break;
    }
    
  }
}

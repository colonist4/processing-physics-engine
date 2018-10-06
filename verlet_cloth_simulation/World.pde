class World{
  ArrayList<Particle> particles;
  ArrayList<Stick> sticks;
  PVector gravity = new PVector(0, 40);
  World(){
    particles = new ArrayList<Particle>();
    sticks = new ArrayList<Stick>();
  }
  
  Particle addParticle(float x, float y, float mass){
    Particle p = new Particle(x, y, mass);
    particles.add(p);
    return p;
  }
  
  Stick addStick(Particle p1, Particle p2, float length){
    Stick s = new Stick(p1, p2, length);
    sticks.add(s);
    return s;
  }
  
  void step(){
    //float dt = 1/60.0f;
    float dt = 0.01f;
    for(Particle p:particles){
      p.applyForce(gravity);
      p.step(dt);
    }
    
    for(Stick s:sticks){
      s.constrain();
    }
  }
  
  void draw(){
    for(Particle p:particles){
      p.draw();
    }
    for(Stick s:sticks){
      s.draw();
    }
  }
  
}

class World{
  ArrayList<Particle> particles;
  static final float dt = 0.1;
  World(){
    particles = new ArrayList<Particle>();
  }
  
  void applyGravity(){
    PVector gravity = new PVector(0, 10);
    for(Particle p : particles){
      p.applyForce(gravity);
    }
  }
  
  void addParticle(float x, float y){
    particles.add(new Particle(x, y, 1));
  }
  
  void update(){
    for(Particle p : particles){
      p.update(dt);
    }
  }
  
  void draw(){
    for(Particle p : particles){
      p.draw();
    }
  }
}

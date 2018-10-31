class World{
  ContactResolver resolver;
  CompositeGenerator cg;
  CollisionDetector cd;
  
  ArrayList<Particle> particles;
  ArrayList<Composite> composites;
  static final float dt = 0.1;
  final PVector gravity = new PVector(2,10);
  World(){
    particles = new ArrayList<Particle>();
    composites = new ArrayList<Composite>();
    resolver = new ContactResolver();
    cg = new CompositeGenerator();
    cd = new CollisionDetector();
  }
  
  void applyGravity(){
    for(Composite c: composites)
      c.applyForce(gravity);
  }
  
  void addParticle(float x, float y){
    //particles.add(new Particle(x, y, 1, 5));
    composites.add(cg.makeParticle(x,y));
  }
  
  void addSquare(float x, float y, float w, float h){
    composites.add(cg.makeSquare(x,y,w,h));
  }
  
  void inertia(){
    for(Composite c: composites)
      c.inertia(dt);
  }
  
  void accelerate(){
    for(Composite c: composites)
      c.accelerate(dt);
  }
  
  void update(boolean collision){
    
    applyGravity();
    accelerate();
    
    for(int i=0; i<5; i++){
      if(collision){
        collisionDetection();
        resolver.solve(false);
      }
      for(Composite c: composites)
        c.solve();
    }
    
    inertia();
    
    if(collision){
      collisionDetection();
      resolver.solve(true);
    }
    
    for(Composite c: composites)
        c.screenBound();
    //for(Particle p : particles){
    //  p.update(dt);
    //  p.screenBound();
    //}
  }
  
  void collisionDetection(){
    resolver.reset();
    
    for(int i=0; i<composites.size(); i++){
      for(int j=i+1; j<composites.size(); j++){
        Composite A = composites.get(i);
        Composite B = composites.get(j);
        
        if(A.type == Composite.Particle){
          if(B.type == Composite.Particle){
            Contact c = cd.circleToCircle(A, B);
            if(c != null) resolver.contacts.add(c);
          }
        }
        
        
        //PVector dist = PVector.sub(A.position, B.position);
        //if(dist.magSq() <= (A.radius + B.radius)*(A.radius + B.radius)){
        //  Contact c = new Contact();
        //  c.A = A;
        //  c.B = B;
        //  c.p_depth = (A.radius + B.radius) - dist.mag();
        //  c.collisionVector = dist.normalize();
          
        //  resolver.contacts.add(c);
        //}
      }
    }
  }
  
  void draw(){    
    for(Composite c: composites)
      c.draw();
  }
}

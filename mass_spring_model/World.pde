class World{
  ArrayList<Body> bodies;
  ArrayList<ForceGenerator> fg;
  
  World(){
    bodies = new ArrayList<Body>();
    fg = new ArrayList<ForceGenerator>();
  }
  
  Circle addCircle(PVector position, float size, float mass){
    Circle c = new Circle(position, size, mass);
    bodies.add(c);
    addGravity(c);
    
    return c;
  }
  
  Spring addSpring(Body b1, Body b2, float k, float l){
    Spring s = new Spring(b1, b2, k, l);
    fg.add(s);
    
    return s;
  }
  
  void addGravity(Body b){
    Gravity g = new Gravity(b);
    fg.add(g);
  }
  
  void step(){
    //float dt = 1.0f / 60.0f;
    float dt = 0.1f;
    for(ForceGenerator g : fg){
      g.applyForce();
    }
    
    for(Body b : bodies){
      b.update(dt);
      //b.side();
    }
  }
  
  void draw(){
    for(ForceGenerator g : fg){
      g.draw();
    }
    
    for(Body b : bodies){
      b.draw();
    }
  }
}

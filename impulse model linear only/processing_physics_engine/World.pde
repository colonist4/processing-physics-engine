class World{
  ArrayList<Body> bodies;
  int prevTime, iterations = 10;
  PVector gravity = new PVector(0, 0);
  ArrayList<Contact> contacts;
  
  World(){
    bodies = new ArrayList<Body>();
    contacts = new ArrayList<Contact>();
    prevTime = millis();
  }
  
  void draw(){
    for(Body b : bodies){
      b.draw();
    }
  }
  
  void applyWind(PVector wind){
    for(Body b : bodies){
      b.applyForce(wind);
    }
  }
  
  void update(){
    //float dt = (millis() - prevTime) / 1000.0f;
    prevTime = millis();
    float dt = 1.0f / 60.0f;
    float inv_dt = 1.0f / dt;
    
    for(Body b : bodies){
      if(b.invMass == 0) continue;
      
      PVector f = new PVector(250 - b.position.x, 250 - b.position.y);
      b.applyForce(f);
      
      b.velocity.add(PVector.add(gravity, PVector.mult(b.force, b.invMass)));
    }
    
    broadPhase();
    for(int i=0; i<iterations; i++){
      for(Contact c: contacts){
        c.applyImpulse(inv_dt);
      }
    }
    
    for(Body b : bodies){
      b.position.add(PVector.mult(b.velocity, dt));
      b.force.set(0, 0);
    }
  }
  
  void addBox(PVector position, PVector size, float mass){
    bodies.add(new Box(position, size, mass));
  }
  void addBox(PVector position, float w, float h, float mass){
    addBox(position, new PVector(w, h), mass);
  }
  
  void broadPhase(){    
    contacts.clear();
    
    // AABB collision detection
    for(int i=0; i<bodies.size(); i++){
      Body _b1 = bodies.get(i);
      for(int j=i+1; j<bodies.size(); j++){
        Body _b2 = bodies.get(j);
        if(_b1.type == Body.RECT && _b2.type == Body.RECT){
          Box b1 = (Box)_b1;
          Box b2 = (Box)_b2;
          
          float maxDepth = -1000;
          PVector normal = new PVector(0, 0);
          // n : b1 -> b2
          PVector n = new PVector(b2.position.x - b1.position.x, 0);
          float d = n.mag() - (b1.size.x/2 + b2.size.x/2);
          if(d > maxDepth) {
            maxDepth = d;
            normal = n;
          }
          
          n = new PVector(0, b2.position.y - b1.position.y);
          d = n.mag() - (b1.size.y/2 + b2.size.y/2);
          if(d > maxDepth) {
            maxDepth = d;
            normal = n;
          }
          
          // collide!!
          if(maxDepth < 0){
            contacts.add(new Contact(b1, b2, maxDepth, normal.normalize()));
          }
        } 
      }
    }
    
    
    for(Contact c : contacts){
      c.b1.isCollide = c.b2.isCollide = true;
    }
  }
}

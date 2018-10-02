abstract class Body{
  final static int RECT = 0;
  
  PVector position, velocity, force, impulse;
  float invMass;
  int type;
  boolean isCollide = false;
  
  
  abstract void draw();
  abstract void applyForce(PVector f);
  //abstract void applyImpulse(PVector p);
  //abstract void update(float dt);
}

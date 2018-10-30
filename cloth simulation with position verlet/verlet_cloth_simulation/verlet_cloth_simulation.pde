World world;
void setup(){
  size(500, 500);
  frameRate(300);
  world = new World();
  Particle p1 = world.addParticle(50, 50, 4);//.positionOld.x -= 1;
  p1.positionOld.x -= 1;
  //Particle p2 = world.addParticle(30, 50, 4);//.positionOld.x -= 1;
  //world.addStick(p1,p2,20);
  
}

void draw(){
  background(255);
  world.step();
  world.draw();
  
  fill(0);
  text(frameRate, 20, 20);
}

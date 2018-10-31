
World world = new World();

void setup(){
  size(500, 500);
}

void mousePressed(){
  world.addParticle(mouseX, mouseY);
}

void draw(){
  background(0);
  
  
  world.applyGravity();
  world.update();
  world.draw();
}

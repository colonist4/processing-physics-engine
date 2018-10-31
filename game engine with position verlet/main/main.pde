
World world = new World();

void setup(){
  size(500, 500);
  frameRate(60);
}

void mousePressed(){
  world.addParticle(mouseX, mouseY);
  //world.addSquare(mouseX, mouseY, 20, 20);
}

void draw(){
  background(0);
  
  world.update(true);
  world.draw(); 
 
  textSize(20);
  fill(255, 0, 0);
  textAlign(RIGHT, TOP);
  text(frameRate+" fps", width, 0);
  
  if(mousePressed && frameCount % 2 == 0){
    //world.addParticle(mouseX, mouseY);
  }
}

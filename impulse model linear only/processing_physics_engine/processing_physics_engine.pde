World world;
float frame = 0;
PVector wind = new PVector(10, 0);

void setup(){
  size(500, 500);
  frameRate(60);
  world = new World();
  
  world.addBox(new PVector(50, 100), 40, 20, 20);
  world.addBox(new PVector(50, 150), 40, 20, 10);
  world.addBox(new PVector(150, 150), 40, 20, 10);
  world.addBox(new PVector(250, 150), 40, 20, 10);
  world.addBox(new PVector(350, 250), 40, 20, 10);
  world.addBox(new PVector(450, 300), 40, 20, 10);
  
  world.addBox(new PVector(250, 450), width, 100, -1);
  world.addBox(new PVector(-10, 250), 20, height, -1);
  world.addBox(new PVector(510, 250), 20, height, -1);
}

void draw(){
  background(255);
  world.draw();
  
  world.applyWind(wind);
  
  world.update();
  
  drawFrame();
}

void drawFrame(){
  frame = frame * 0.99 + 0.01 * frameRate;
  fill(0);
  textSize(15);
  textAlign(LEFT, TOP);
  text((int)frame, 10, 10);
}

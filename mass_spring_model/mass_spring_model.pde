World world;
Circle last, first;
Circle selected;
float t=0;

void setup(){
  size(500, 500);
  world = new World();
  frameRate(300);
  
  example1();
  
}

void example1(){
  PVector pos = new PVector(50, 250);
  Circle prevCircle = null;
  for(int x = 50; x<=450; x+=5){
    pos.x = x;
    Circle c = world.addCircle(pos, 2, 1);
    if(prevCircle != null)
      world.addSpring(prevCircle, c, 1, 1);
    prevCircle = c;
    if(first == null) first = c;
  }
  
  last = prevCircle;
  first.invMass = 0;
  last.invMass = 0;
}

void example2(){
  Circle c1 = world.addCircle(new PVector(100, 100), 5, 0.01);
  Circle c2 = world.addCircle(new PVector(200, 100), 5, 0.01);
  Circle c3 = world.addCircle(new PVector(200, 200), 5, 0.01);
  Circle c4 = world.addCircle(new PVector(100, 200), 5, 0.01);
  
  world.addSpring(c1, c2, 1, 100);
  world.addSpring(c2, c3, 1, 100);
  world.addSpring(c3, c4, 1, 100);
  world.addSpring(c4, c1, 1, 100);
  world.addSpring(c1, c3, 1, 100*sqrt(2));
}

void example3(){
  Circle c1 = world.addCircle(new PVector(100, 100), 5, 0.01);
  Circle c2 = world.addCircle(new PVector(200, 100), 5, 0.01);
  Circle c3 = world.addCircle(new PVector(200, 200), 5, 0.01);
  Circle c4 = world.addCircle(new PVector(100, 200), 5, 0.01);
  
  world.addSpring(c1, c2, 1, 100);
  world.addSpring(c2, c3, 1, 100);
  world.addSpring(c3, c4, 1, 100);
  world.addSpring(c4, c1, 1, 100);
  world.addSpring(c1, c3, 1, 100*sqrt(2));
  
  c1 = world.addCircle(new PVector(100, 250), 5, 0.01);
  c2 = world.addCircle(new PVector(200, 250), 5, 0.01);
  c3 = world.addCircle(new PVector(200, 350), 5, 0.01);
  c4 = world.addCircle(new PVector(100, 350), 5, 0.01);
  
  world.addSpring(c1, c2, 1, 100);
  world.addSpring(c2, c3, 1, 100);
  world.addSpring(c3, c4, 1, 100);
  world.addSpring(c4, c1, 1, 100);
  world.addSpring(c1, c3, 1, 100*sqrt(2));
}

void draw(){
  background(255);
  
  world.step();
  world.draw();
  
  textSize(16);
  textAlign(LEFT, TOP);
  text(parseInt(frameRate)+"fps", 10, 10);
  
  t += 0.01;
  
  if(selected != null){
    selected.position.x = mouseX;
    selected.position.y = mouseY;
  }
}

void mousePressed(){
  PVector p = new PVector(mouseX, mouseY);
  if(selected != null) selected.invMass = 1/selected.mass;
  selected = null;
  for(Body c : world.bodies){
    if(c.isInside(p)){
      selected = (Circle)c;
      selected.invMass = 0;
      break;
    }
  }
}

void mouseReleased(){
  if(selected != null) selected.invMass = 1/selected.mass;
  selected = null;
}

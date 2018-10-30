World world;
Circle last, first;
Circle selected;
float t=0;

void setup(){
  size(500, 500);
  world = new World();
  frameRate(300);
  
  //Circle c1 = world.addCircle(new PVector(100, 250), 10, -1);
  //Circle c2 = world.addCircle(new PVector(180, 250), 10, 1);
  //world.addSpring(c1, c2, 1, 50);
  
  PVector pos = new PVector(50, 250);
  Circle prevCircle = null;
  for(int x = 50; x<=450; x+=1){
    pos.x = x;
    Circle c = world.addCircle(pos, 2, 0.001);
    if(prevCircle != null)
      world.addSpring(prevCircle, c, 5, 1);
    prevCircle = c;
    if(first == null) first = c;
  }
  
  last = prevCircle;
  first.invMass = 0;
  last.invMass = 0;
}

void draw(){
  background(255);
  
  world.step();
  world.draw();
  
  textSize(16);
  textAlign(LEFT, TOP);
  text(parseInt(frameRate)+"fps", 10, 10);
  
  t += 0.01;
  
  //last.position.y = 250 + 50*sin(t);
  //last.velocity.y = 50*cos(t);
  //first.velocity.x = 0;
  //first.position.x = 50;
  //first.position.y = constrain(first.position.y, 200, 300); 
  
  //first.position.x = mouseX;
  //first.position.y = mouseY;
  
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

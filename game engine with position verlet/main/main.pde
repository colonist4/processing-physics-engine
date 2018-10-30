
Particle p = new Particle(250, 250, 1);

void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  
  p.update(0.01);
  p.draw();
}

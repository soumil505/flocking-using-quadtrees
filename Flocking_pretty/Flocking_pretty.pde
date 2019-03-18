

Flock flock;

void setup() {
  size(500, 500);
  background(30);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 150; i++) {
    flock.addBoid(new Boid(width/2,height/2,int(random(255)),int(random(255)),int(random(255))));
  }
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  flock.run();
  println(frameRate);
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY,int(random(255)),int(random(255)),int(random(255))));
}

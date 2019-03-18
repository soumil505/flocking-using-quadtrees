Flock flock;

void setup() {
  size(500, 500);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 300; i++) {
    flock.addBoid(new Boid(width/2 +random(-50, 50), height/2+random(-50, 50)));
  }
}

void draw() {
  background(0);
  flock.run();
  textSize(15);
  fill(200);
  text("Framerate: "+Integer.toString((int)frameRate),10,30);
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}

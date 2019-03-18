import java.util.ArrayList;
Quadtree qtree;
int cap;

public void setup () {
  size(500, 500);
  background(0);
  cap=20;
  qtree = new Quadtree (new Rectangle (width/2, height/2, width/2, height/2), cap);
  for (int i  = 0; i < 300; i++) {
    qtree.insert(new Point ( width/2 +random(-50, 50), height/2+random(-50, 50)));
  }
}



public ArrayList <Point> traverse(Quadtree Qtree) {
  ArrayList <Point> points = new ArrayList<Point>();
  for (Point p : Qtree.points) {

    points.add(p);
  }
  if (Qtree.divide) {
    for (Point p : traverse(Qtree.northeast)) {
      points.add(p);
    }
    for (Point p : traverse(Qtree.northwest)) {
      points.add(p);
    }
    for (Point p : traverse(Qtree.southeast)) {
      points.add(p);
    }
    for (Point p : traverse(Qtree.southwest)) {
      points.add(p);
    }
  } 


  return points;
}



public void recalculate() {
  ArrayList <Point> points = new ArrayList<Point>();

  points=traverse(qtree);
  qtree.divide=false;
  qtree.points.clear();
  qtree.northeast=null;
  qtree.northwest=null;
  qtree.southeast=null;
  qtree.southwest=null;
  for (Point p : points) {
    qtree.insert(p);
  }
}

public void draw () {
  if (mousePressed) {

    for (int i  = 0; i < 10; i++) {
      qtree.insert(new Point ( mouseX +random(-5, 5), mouseY+random(-5, 5)));
    }
  }
  background(0);
  textSize(15);
  fill(200);
  text("Framerate: "+Integer.toString((int)frameRate), 10, 30);
  if (frameCount%15==0) {

    recalculate();
  }

  qtree.show();
}

import java.util.ArrayList; //<>// //<>//

class Quadtree {
  Rectangle boundry;
  int capacity; // max no. of points
  ArrayList <Point> points ;
  boolean divide = false;
  Quadtree northeast; 
  Quadtree northwest;
  Quadtree southeast;
  Quadtree southwest;

  public Quadtree (Rectangle rect, int cap) {
    this.boundry = rect;
    this.capacity = cap;
    points = new ArrayList<Point>();
  }

  public boolean contains (Point p) {
    return  p.position.x <= this.boundry.x+this.boundry.width &&
      p.position.x >= this.boundry.x-this.boundry.width &&
      p.position.y <= this.boundry.y+this.boundry.height &&
      p.position.y >= this.boundry.y-this.boundry.height ;
  }

  public boolean insert (Point p) {
    if (p.position.x<0) p.position.x=0;
    if (p.position.y<0) p.position.y=0;
    if (p.position.x>width) p.position.x=width;
    if (p.position.y>height) p.position.y=height;
    if (!this.contains(p)) return false;
    if (this.points.size() < this.capacity ) {
      this. points.add(p); 
      return true;
    } else {
      if (!this.divide) {
        subDivide();
      }
      if (this.northeast.insert(p)) {
        return true;
      } else if (this.northwest.insert(p)) {
        return true;
      } else if (this.southeast.insert(p)) {
        return true;
      } else if (this.southwest.insert(p)) {
        return true;
      } else return false;
    }
  }
  public void  subDivide () {
    double x = this.boundry.x;
    double y = this.boundry.y;
    double w = this.boundry.width;
    double h = this.boundry.height;
    this.northeast = new Quadtree(new Rectangle (x+w/2, y-h/2, w/2, h/2), capacity);
    this.northwest = new Quadtree(new Rectangle (x-w/2, y-h/2, w/2, h/2), capacity);
    this.southeast = new Quadtree(new Rectangle (x+w/2, y+h/2, w/2, h/2), capacity);
    this.southwest = new Quadtree(new Rectangle (x-w/2, y+h/2, w/2, h/2), capacity);
    this.divide = true;
  }



  public void show () {
    stroke(255);
    strokeWeight(1);
    noFill();
    rectMode(CENTER);
    rect ((float)this.boundry.x, (float)this.boundry.y, (float)this.boundry.width *2, (float)this.boundry.height*2);
    for (Point p : points) {

      //ellipse((float)p.position.x , (float)p.position.y, 1,1);
      p.run(points);
    }
    if (this.divide) {
      this.northeast.show();
      this.northwest.show();
      this.southeast.show();
      this.southwest.show();
    }
  }
}

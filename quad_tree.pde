
class QuadTree {
  int capacity;
  QuadTree a, b, c, d;
  Rectangle boundary;
  boolean divided;
  ArrayList<Dot> dots;

  QuadTree(Rectangle boundary, int capacity) {
    this.boundary = boundary;
    this.capacity = capacity;
    dots = new ArrayList<Dot>();
    divided = false;
  }

  boolean insert(Dot dot) {
    if (!this.boundary.contains(dot)) {
      return false;
    }

    if (dots.size() < capacity) {
      dots.add(dot);
      return true;
    }

    if (!this.divided) {
      this.subdivide();
    }
    
    return a.insert(dot) || b.insert(dot) || c.insert(dot) || d.insert(dot);
  }

  void subdivide() {
    a = new QuadTree(new Rectangle(x, y, boundary.size/2), capacity);
    b = new QuadTree(x + size/2, y, size/2);
    c = new QuadTree(x + size/2, y + size/2, size/2);
    d = new QuadTree(x, y + size/2, size/2);
    subdivided = true;
  }
}

class Rectangle {
  float x, y, size;

  Rectangle(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  boolean contains(Dot dot) {
    if (dot.x > left() && dot.x + size < right() && dot.y > top() && dot.y + size < bottom() ) {
      return true;
    }
    return false;
  }

  float right() {
    return this.x + size;
  }

  float left() {
    return this.x;
  }

  float top() {
    return this.y;
  }

  float bottom() {
    return this.y + size;
  }
}

class Dot {
  float x, y;

  Dot(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class Bomb {
  float x, y;
  int size;
  PShape bombShape; // Declare a variable to store the SVG file

  Bomb(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    bombShape = loadShape("D:\\Kuliah\\sem 3\\Grafika\\bomb.svg");
  }

  void display() {
    
    shape(bombShape, x, y, size, size);
  }

  void update() {
    y += 2;

    if (y > height) {
      respawn();
    }
  }

  void respawn() {
    x = random(width);
    y = 0;
  }
}

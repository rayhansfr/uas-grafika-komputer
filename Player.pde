class Player {
  float x, y;
  int size;
  PShape basket; // Declare a variable to store the SVG file


  Player(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    basket = loadShape("D:\\Kuliah\\sem 3\\Grafika\\basket.svg"); // Load the SVG file
  }

  void display() {
    shape(basket, x, 300, 40, 40); // Display the SVG file
  }

  void move(int dir) {
    if (dir == LEFT && x > size / 2) {
      x -= 5;
    } else if (dir == RIGHT && x < width - size / 2) {
      x += 5;
    }
  }
}

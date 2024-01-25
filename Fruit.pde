class Fruit {
  float x, y;
  int size;
  PShape fruitShape; // Declare a variable to store the SVG file


  Fruit(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    String[] fruitFiles = {"D:\\Kuliah\\sem 3\\Grafika\\fruit1.svg", "D:\\Kuliah\\sem 3\\Grafika\\fruit2.svg", "D:\\Kuliah\\sem 3\\Grafika\\fruit3.svg"}; // Array of SVG file names
    String selectedFruit = fruitFiles[int(random(fruitFiles.length))]; // Select a random SVG file
    fruitShape = loadShape(selectedFruit); // Load the selected SVG file    
  }

  void display() {
    shape(fruitShape, x, y, size, size); // Display the SVG file

  }

  void update() {
    y += 2;

    if (y > height) {
      respawn();
    }
  }

  void update(float y) {
    this.y += y;

    if (y > height) {
      respawn();
    }
  }

  void respawn() {
    x = random(width);
    y = 0;
    String[] fruitFiles = {"D:\\Kuliah\\sem 3\\Grafika\\fruit1.svg", "D:\\Kuliah\\sem 3\\Grafika\\fruit2.svg", "D:\\Kuliah\\sem 3\\Grafika\\fruit3.svg"}; // Array of SVG file names
    String selectedFruit = fruitFiles[int(random(fruitFiles.length))]; // Select a random SVG file
    fruitShape = loadShape(selectedFruit); // Load the selected SVG file 
  }
}

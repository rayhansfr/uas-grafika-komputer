
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

Player player;
Fruit fruit;
Bomb bomb;
int score = 0;

PImage backgroundImage; // Declare a variable to store the background image

void setup() {
  size(200, 400);
  backgroundImage = loadImage("D:\\Kuliah\\sem 3\\Grafika\\bgphoto2.jpg"); // Load the background image
  player = new Player(width / 2, height - 50, 30);
  fruit = new Fruit(random(width), 0, 30);
  bomb = new Bomb(random(width), 0, 30);
}

void draw() {
  background(backgroundImage);

  player.display();
  fruit.display();
  bomb.display();

  fruit.update();
  bomb.update();

  // Cek tabrakan dengan buah
  if (dist(player.x, player.y, fruit.x, fruit.y) < player.size / 2 + fruit.size / 2) {
    score++;
    fruit.respawn();
  }

  // Cek tabrakan dengan bom
  if (dist(player.x, player.y, bomb.x, bomb.y) < player.size / 2 + bomb.size / 2) {
    score--;
    bomb.respawn();
  }

  // Gambar skor
  fill(0);
  textSize(16);
  textAlign(LEFT);
  text("Score: " + score, 20, 20);

}

void keyPressed() {
  // Gerakkan pemain
  player.move(keyCode);
}

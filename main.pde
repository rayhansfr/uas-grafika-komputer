class Player {
  float x, y;
  int size;

  Player(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    fill(0, 0, 255);
    ellipse(x, y, size, size);
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

  Fruit(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    fill(0, 255, 0);
    ellipse(x, y, size, size);
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

class Bomb {
  float x, y;
  int size;

  Bomb(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
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

void setup() {
  size(400, 400);
  player = new Player(width / 2, height - 50, 30);
  fruit = new Fruit(random(width), 0, 30);
  bomb = new Bomb(random(width), 0, 30);
}

void draw() {
  background(255);

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

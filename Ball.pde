class Ball {
  float x, y;
  int size;
  color ballColor;

  Ball(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.ballColor = color(random(255), random(255), random(255)); 
  }

  void display() {
    fill(ballColor); 
    ellipse(x, y, size, size);
  }

  void update() {
    y += 2;

    if (y > height) {
      respawn();
    }
  }
 
  public void update(float speed) {
      y += speed;

      if (y > height) {
          respawn();
      }
  }

  void respawn() {
    x = random(width);
    y = 0;
    ballColor = color(random(255), random(255), random(255)); 
  }
}

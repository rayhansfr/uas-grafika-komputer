public class Player {
    float x, y;
    int size;
    int lives;

    public Player(float x, float y, int size, int lives) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.lives = lives;
    }

    public void display() {
        fill(0, 0, 255);
        ellipse(x, y, size, size);
    }

    public void move(int dir) {
        if (dir == LEFT && x > size / 2) {
            x -= 5;
        } else if (dir == RIGHT && x < width - size / 2) {
            x += 5;
        }
    }

    public void loseLife() {
        lives--;
    }

    public void regainLife() {
        if (lives < 3) {
            lives++;
        }
    }

    public int getLives() {
        return lives;
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

    void update(float fallSpeed) {
        y += fallSpeed;

        if (y > height) {
            respawn();
        }
    }

    void respawn() {
        x = random(width);
        y = -random(200, 800);
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

    void update(float fallSpeed) {
        y += fallSpeed;

        if (y > height) {
            respawn();
        }
    }

    void respawn() {
        x = random(width);
        y = -random(200, 800);
    }
}

Player player;
Fruit[] fruits;
Bomb[] bombs;
int score = 0;
boolean gameOver = false;

float fruitFallSpeed = 2; // Kecepatan penurunan buah
float bombFallSpeed = 2;  // Kecepatan penurunan bom

void setup() {
    size(200, 400);
    player = new Player(width / 2, height - 50, 30, 3);
    fruits = new Fruit[2]; // Maximum of 3 fruits on the screen at a time
    bombs = new Bomb[2];  // Maximum of 3 bombs on the screen at a time

    // Initialize fruits
    for (int i = 0; i < fruits.length; i++) {
        fruits[i] = new Fruit(random(width), -random(200, 800), 30);
    }

    // Initialize bombs
    for (int i = 0; i < bombs.length; i++) {
        bombs[i] = new Bomb(random(width), -random(200, 800), 30);
    }
}

void draw() {
    background(255);

    if (!gameOver) {
        player.display();

        // Update and display fruits
        for (int i = 0; i < fruits.length; i++) {
            fruits[i].display();
            fruits[i].update(fruitFallSpeed);

            // Check collision with fruit
            if (dist(player.x, player.y, fruits[i].x, fruits[i].y) < player.size / 2 + fruits[i].size / 2) {
                score++;
                fruits[i].respawn();
                player.regainLife(); // Regain life when catching fruit
            }
        }

        // Update and display bombs
        for (int i = 0; i < bombs.length; i++) {
            bombs[i].display();
            bombs[i].update(bombFallSpeed);

            // Check collision with bomb
            if (dist(player.x, player.y, bombs[i].x, bombs[i].y) < player.size / 2 + bombs[i].size / 2) {
                score--;
                bombs[i].respawn();
                player.loseLife(); // Lose life when catching bomb
            }
        }

        if (player.getLives() <= 0) {
            gameOver = true;
        }

        // Display lives
        fill(255, 0, 0);
        textSize(16);
        textAlign(LEFT);
        text("Lives: " + player.getLives(), 20, 40);

        // Display score
        fill(0);
        textSize(16);
        textAlign(LEFT);
        text("Score: " + score, 20, 20);

        // Level system: Increase fall speed as score increases
        if (score >= 5) {
            fruitFallSpeed = 2.5;
            bombFallSpeed = 2.5;
        }
        if (score >= 10) {
            fruitFallSpeed = 3.5;
            bombFallSpeed = 3.5;
        }
        if (score >= 15) {
            fruitFallSpeed = 4;
            bombFallSpeed = 4;
            // Increase the number of bombs as the score reaches a certain level
            if (bombs.length < 4) {
                Bomb[] newBombs = new Bomb[bombs.length + 1];
                for (int i = 0; i < bombs.length; i++) {
                    newBombs[i] = bombs[i];
                }
                newBombs[bombs.length] = new Bomb(random(width), -random(200, 800), 30);
                bombs = newBombs;
            }
        }
        if (score >= 20) {
            fruitFallSpeed = 5;
            bombFallSpeed = 5;
            // Increase the number of bombs as the score reaches a certain level
            if (bombs.length < 5) {
                Bomb[] newBombs = new Bomb[bombs.length + 1];
                for (int i = 0; i < bombs.length; i++) {
                    newBombs[i] = bombs[i];
                }
                newBombs[bombs.length] = new Bomb(random(width), -random(200, 800), 30);
                bombs = newBombs;
            }
        }
        if (score >= 25) {
            fruitFallSpeed = 7;
            bombFallSpeed = 7;
            // Increase the number of bombs as the score reaches a certain level
            if (bombs.length < 6) {
                Bomb[] newBombs = new Bomb[bombs.length + 1];
                for (int i = 0; i < bombs.length; i++) {
                    newBombs[i] = bombs[i];
                }
                newBombs[bombs.length] = new Bomb(random(width), -random(200, 800), 30);
                bombs = newBombs;
            }
        }
        if (score >= 30) {
            fruitFallSpeed = 8;
            bombFallSpeed = 8;
            // Increase the number of bombs as the score reaches a certain level
            if (bombs.length < 7) {
                Bomb[] newBombs = new Bomb[bombs.length + 1];
                for (int i = 0; i < bombs.length; i++) {
                    newBombs[i] = bombs[i];
                }
                newBombs[bombs.length] = new Bomb(random(width), -random(200, 800), 30);
                bombs = newBombs;
            }
        }
        // Add more levels and adjust fall speeds as needed

    } else {
        // Game over message
        fill(255, 0, 0);
        textSize(24);
        textAlign(CENTER);
        text("Game Over!", width / 2, height / 2);
    }
}

void keyPressed() {
    // Move player
    player.move(keyCode);
}

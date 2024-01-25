
public class Player {
    float x, y;
    int size;
    int lives;
    PShape basket; // Declare a variable to store the SVG file

    public Player(float x, float y, int size, int lives) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.lives = lives;
        basket = loadShape("assets/basket.svg"); // Load the SVG file
    }

    public void display() {
        pushMatrix();
        translate(x, y);
        shape(basket, x, y, size, size);
        popMatrix();
        
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

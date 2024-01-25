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

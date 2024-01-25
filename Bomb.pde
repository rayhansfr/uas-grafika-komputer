import processing.svg.*;
public class Bomb {
    float x, y;
    int size;
    float speed;
    PShape bombSVG;

    public Bomb(float x, float y, int size, PShape bombSVG) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.bombSVG = bombSVG;
    }

    public void display() {
        pushMatrix();
        translate(x, y);
        shape(bombSVG, 0, 0, size, size);
        popMatrix();
    }

    public void update() {
        y += 2;

        if (y > height) {
            respawn();
        }
    }

    public void respawn() {
        x = random(width);
        y = 0;
    }
}

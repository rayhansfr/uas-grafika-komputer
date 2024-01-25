import processing.svg.*;
public class Fruit {
    float x, y;
    int size;
    float speed;
    PShape fruitSVG;

    public Fruit(float x, float y, int size, PShape fruitSVG) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.fruitSVG = fruitSVG;
    }

    public void display() {
        pushMatrix();
        translate(x, y);
        shape(fruitSVG, 0, 0, size, size);
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

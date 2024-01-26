
import processing.svg.*;
public class Bomb {
    float x, y;
    int size;
    float speed;
    PShape bombShape; 

    public Bomb(float x, float y, int size) {
        this.x = x;
        this.y = y;
        this.size = size;
        bombShape = loadShape("assets/bomb (1).svg");
    }

    public void display() {
        pushMatrix();
        translate(x, y);
        shape(bombShape, 0, 0, size, size);
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

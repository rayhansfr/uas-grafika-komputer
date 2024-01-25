Player player;
Fruit[] fruits;
Bomb[] bombs;
PShape[] fruitSVGs;
int score = 0;
boolean gameOver = false;

void setup() {
 size(200, 400);
 player = new Player(width / 2, height - 50, 30, 3);
 fruits = new Fruit[2]; // Maximum of 3 fruits on the screen at a time
 bombs = new Bomb[2]; // Maximum of 3 bombs on the screen at a time

 fruitSVGs = new PShape[5]; 
 fruitSVGs[0] = loadShape("assets/Gerald-G-Simple-Fruit-FF-Menu-4.svg");
 fruitSVGs[1] = loadShape("assets/Gerald-G-Simple-Fruit-FF-Menu-5.svg");
 fruitSVGs[2] = loadShape("assets/Gerald-G-Simple-Fruit-FF-Menu.svg");
 fruitSVGs[3] = loadShape("assets/15930333081593032446pitr_Bananas_icon.svg");
 fruitSVGs[4] = loadShape("assets/Gerald_G_Simple_Fruit_(FF_Menu)_15.svg");

 // Initialize fruits
 for (int i = 0; i < fruits.length; i++) {
   PShape randomFruit = fruitSVGs[int(random(5))];
   fruits[i] = new Fruit(random(width), -random(200, 800), 30, randomFruit);
 }

 // Initialize bombs
 for (int i = 0; i < bombs.length; i++) {
   PShape bomb = loadShape("assets/bomb.svg");
   bombs[i] = new Bomb(random(width), -random(200, 800), 50, bomb);
 }
}

void draw() {
 background(255);

 if (!gameOver) {
   player.display();

   // Update and display fruits
   for (int i = 0; i < fruits.length; i++) {
     fruits[i].display();
     fruits[i].update();

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
     bombs[i].update();

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

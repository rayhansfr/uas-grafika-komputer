Player player;
Ball[] balls;
Bomb[] bombs;
int score = 0;
boolean gameOver = false;
PImage backgroundImage;

void setup() {
  size(200, 416);
  backgroundImage = loadImage("assets/bg-2.png");
  player = new Player(width / 2, height-80, 30, 3);
  balls = new Ball[2];
  bombs = new Bomb[2];

  // Initialize balls
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(width), -random(200, 800), 30);
    
  }
  // Initialize bombs
  for (int i = 0; i < bombs.length; i++) {
    bombs[i] = new Bomb(random(width), -random(200, 800), 30);
  }

}

void draw() {
 background(backgroundImage);

 if (!gameOver) {
   player.display();

   // Update and display balls
   for (int i = 0; i < balls.length; i++) {
     balls[i].display();
     balls[i].update();
     if (balls[i].y == height) {
       score--;
    }

     // Check collision with balls
     if (dist(player.x, player.y, balls[i].x, balls[i].y) < player.size / 2 + balls[i].size / 2) {
       score++;
       balls[i].respawn();
       player.regainLife(); // Regain life when catching fruit
     }
     if (score >= 10) {
       balls[i].update(2.5);
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
   
   if (player.getLives() <= 0 && score < 0) {
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
   textSize(12);
   text("Score: " + score, width / 2, height / 2 + 20);
   text("Tekan Enter untuk Mulai Kembali!", width / 2, height / 2 + 40);
 }
}

void keyPressed() {
 // Move player
 player.move(keyCode);
 
 if (gameOver && keyCode == ENTER) {
    restartGame();
  } else {
    // Move player
    player.move(keyCode);
  }
}

void restartGame() {
  // Reset game state
  score = 0;
  gameOver = false;
  player.resetLives();

  // Reset player position
  player.x = width / 2;
  player.y = height - 80;

  // Reset balls
  for (int i = 0; i < balls.length; i++) {
    balls[i].respawn();
  }

  // Reset bombs
  for (int i = 0; i < bombs.length; i++) {
    bombs[i].respawn();
  }
}

void keyReleased() {
  if (!gameOver && keyCode == ENTER) {
    // Start the game if Enter is pressed at the beginning
    gameOver = false;
  }
}

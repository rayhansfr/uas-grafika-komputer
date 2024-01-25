// Define possible game states
enum GameState {
  START, // Start page
  PLAY,  // Main game
  GAME_OVER // Game over screen
}

// Current game state
GameState currentState = GameState.START;

void drawStartPage() {
  // Display start page content
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("Press any key to start", width / 2, height / 2);
}

void drawGameOverPage() {
  // Display game over content
  fill(255, 0, 0);
  textSize(24);
  textAlign(CENTER);
  text("Game Over! Press any key to restart", width / 2, height / 2);
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

  if (currentState == GameState.START) {
    drawStartPage();
  } else if (currentState == GameState.PLAY) {
    // Your existing draw game code
    player.display();

    // Update and display fruits
    for (int i = 0; i < fruits.length; i++) {
      // Your existing fruit update and collision code
    }

    // Update and display bombs
    for (int i = 0; i < bombs.length; i++) {
      // Your existing bomb update and collision code
    }

    // Your existing score, lives, and level-up code

    if (player.getLives() <= 0) {
      currentState = GameState.GAME_OVER;
    }

  } else if (currentState == GameState.GAME_OVER) {
    drawGameOverPage();
  }
}

void keyPressed() {
  if (currentState == GameState.START || currentState == GameState.GAME_OVER) {
    // If in start or game over state, start the game on any key press
    currentState = GameState.PLAY;
    setup(); // Reset game state
  } else if (currentState == GameState.PLAY) {
    // Move player only during the game
    player.move(keyCode);
  }
}

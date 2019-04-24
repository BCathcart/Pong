/*
* A Processing 3.0 implementation of the famous arcade game Pong.
* 
* @version 1.0, April 24/2019
*
* @author Brennan Cathcart <brennancathcart@gmail.com> 
*/

AI opponent;
Human human;
Ball ball;

void setup() {
  fullScreen();
  rectMode(CENTER);
  human = new Human();
  opponent = new AI();
  ball = new Ball();
}

void draw() {
  background(0);

  // Draw paddles and arena
  fill(#009fff);
  drawDivider();
  human.draw();
  opponent.draw(ball.posY()); // Opponent tracks the ball

  // Draw ball
  fill(#8CC739);
  ball.update();
  
  // Check if ball reached edge of screen
  ball.checkScreenEdgeHit();
  
  // Check for paddle collisions
  checkHumanPaddleHit();
  checkAiPaddleHit();
  
  checkPointScored();
}

void drawDivider() {
  for (int i = 0; i < height - 10; i++) {
    rect(width/2, i*40, 5, 20);
  }
}

void checkHumanPaddleHit() {
  if (collision(ball.posX(), ball.posY(), ball.diameter(),
                human.paddlePosX(), human.paddlePosY(),
                human.paddleWidth(), human.paddleHeight())) {
     ball.hitPaddle(human.paddlePosY(), opponent.paddleWidth());
  }
}

void checkAiPaddleHit() {
  if (collision(ball.posX(), ball.posY(), ball.diameter(),
                opponent.paddlePosX(), opponent.paddlePosY(),
                opponent.paddleWidth(), opponent.paddleHeight())) {
     ball.hitPaddle(opponent.paddlePosY(), human.paddleWidth());
  }
}

boolean collision(double ball_pos_x, double ball_pos_y, double ball_diameter,
                  double rect_pos_x, double rect_pos_y, double rect_width, double rect_height) {

  if (ball_pos_x + ball_diameter/2 >= rect_pos_x - rect_width/2
      && ball_pos_x - ball_diameter/2 <= rect_pos_x + rect_width/2
      && ball_pos_y + ball_diameter/2 >= rect_pos_y - rect_height/2
      && ball_pos_y - ball_diameter/2 <= rect_pos_y + rect_height/2)
  {
    return true;
  } else {
    return false;
  }
}

void checkPointScored() {
  if (ball.posX() + ball.diameter()/2 < 0) {
    opponent.scored();
    ball.reset(false);
  } else if (ball.posX() - ball.diameter()/2 > width) {
    human.scored();
    ball.reset(true);
  }
}

void keyReleased() {
  human.stop();
}
  
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP) {
      human.moveUp();
    } else if (keyCode == DOWN) {
      human.moveDown();
    }
  }
}

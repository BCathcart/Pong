class AI extends Player {
  
  private double MAX_VELOCITY;
  private double VELOCITY_MULTIPLIER;
  
  AI() {
    super(width - 20, height/2, width/2 + 200, 250);   
    
    MAX_VELOCITY = height/150;
    VELOCITY_MULTIPLIER = height/10800.0;
  }

  public void draw(int ball_pos_y) {
    super.drawScore();
    drawPaddle(ball_pos_y);
  }
  
  private void drawPaddle(int ball_pos_y) {
    super.updatePosY(track(ball_pos_y));
    super.drawPaddle();
  }
  
  private int track(int ball_pos_y) {
    int paddle_pos_y = super.paddlePosY();
    
    // Velocity is proportional to the square of the difference in position
    // between the ball and paddle (until it hits the speed maximum)
    double vel = VELOCITY_MULTIPLIER * (paddle_pos_y - ball_pos_y) * (paddle_pos_y - ball_pos_y);
    
    double new_pos;
    if (paddle_pos_y - ball_pos_y > 0) {
      if (vel > MAX_VELOCITY)
        new_pos = paddle_pos_y - MAX_VELOCITY;
      else
        new_pos = paddle_pos_y - vel + 1;  // Note: always round up
    } else {
      if (vel > MAX_VELOCITY)
        new_pos = paddle_pos_y + MAX_VELOCITY;
      else
        new_pos = paddle_pos_y + vel;
    }
    
    return (int)new_pos;
  }

}

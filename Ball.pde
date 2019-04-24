class Ball {
  
  private final int BALL_DIAM = 15;
  
  private double vel_x, vel_y;
  private int pos_x, pos_y;
  
  Ball() {
    reset(true);
  }
  
  public void reset(boolean human_serve) {
    if (human_serve)
      vel_x = -width/200;
    else
      vel_x = width/200;
    vel_y = 0;
    pos_x = width/2;
    pos_y = height/2;
  }
  
  public void update() {
    pos_x += vel_x;
    pos_y += vel_y;
    show();
  }
    
  public void show() {
    ellipse(pos_x, pos_y, BALL_DIAM, BALL_DIAM);
  }
  
  public void hitPaddle(int paddle_pos_y, int paddle_width) {
    // Increase speed by 0.25 each time
    vel_x = -vel_x - Math.signum(vel_x)/4; 
    
    // Cap velocity at width of paddle
    if (vel_x > paddle_width)
      vel_x = paddle_width;
    else if (vel_x < -paddle_width)
      vel_x = -paddle_width;
    
    double vel_y_factor = 216.0/height;
    vel_y = vel_y_factor * (vel_y * 2 + (pos_y - paddle_pos_y));
  }
  
  private void checkScreenEdgeHit() {    
    // Makes sure ball doesn't get stuck on edge
    if (pos_y + BALL_DIAM/2 > height) {
      pos_y = height - BALL_DIAM/2 - 1;
      vel_y = -vel_y - 1;
    }
    if (pos_y - BALL_DIAM/2 < 0) {
      pos_y = BALL_DIAM/2 + 1;
      vel_y = -vel_y + 1;
    }
  }
  
  public int posX() {
     return pos_x; 
  }
  
  public int posY() {
     return pos_y; 
  }
  
  public int diameter() {
    return BALL_DIAM;
  }
  
}

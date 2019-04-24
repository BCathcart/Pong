class Human extends Player {
 
  private int SPEED;
  private int vel_y;
  
  Human() {
    super(20, height/2, width/2 - 200, 250);   
    SPEED = height/150;
    vel_y = 0;
  }

  public void draw() {
    super.drawScore();
    drawPaddle();
  }
  
  public void drawPaddle() {
    super.updatePosY(super.paddlePosY() + vel_y);
    super.drawPaddle();
  }
  
  public void moveUp() {
    vel_y = -SPEED;
  }
  
  public void moveDown() {
    vel_y = SPEED;
  }
  
  public void stop() {
    vel_y = 0;
  }
  
}

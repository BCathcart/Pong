class Player {

  private final int PADDLE_WIDTH = 15;
  
  private int score;
  private int paddle_pos_x, paddle_pos_y;
	private int score_pos_x, score_pos_y;
  
  Player(int paddle_pos_x, int paddle_pos_y, int score_pos_x, int score_pos_y) {
    this.score = 0;
    this.paddle_pos_x = paddle_pos_x;
    this.paddle_pos_y = paddle_pos_y;
		this.score_pos_x = score_pos_x;
		this.score_pos_y = score_pos_y;

		textAlign(CENTER);
    textSize(256);
  }

	public void drawScore() {
    text(score, score_pos_x, score_pos_y);
  }

  public void scored() {
		score++;
  }
  
  public void drawPaddle() {
    rect(paddle_pos_x, paddle_pos_y, PADDLE_WIDTH, height/15, 7);
  }
    
  public void setPos(int x, int y) {
    paddle_pos_x = x;
    paddle_pos_y = y;
  }
  
  public void updatePosY(int y) {
   paddle_pos_y = y;
  }
  
  public int paddlePosX() {
     return paddle_pos_x; 
  }
  
  public int paddlePosY() {
     return paddle_pos_y; 
  }
  
  public int paddleWidth() {
     return PADDLE_WIDTH; 
  }
  
  public int paddleHeight() {
     return height/15; 
  }
  
}

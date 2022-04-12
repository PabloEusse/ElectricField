class Vector2D {
  public float vec[] = new float[2]; //0 = X, 1 = Y
  float forceX, forceY, posX, posY;
  public Vector2D (float x, float y, float posX, float posY) {
    vec[0] = x;
    vec[1] = y;
    forceX = x;
    forceY = y;
    this.posX = posX;
    this.posY = posY;
  }
  public void setVector(int newX, int newY) {
    vec[0] = newX;
    vec[1] = newY;
  }
  
  public void drawVector(float length) {
    float magnitude = sqrt((vec[0] * vec[0]) + (vec[1] * vec[1]));
    float xNormalized = vec[0] / magnitude;
    float yNormalized = vec[1] / magnitude;
    line(posX, posY, posX + xNormalized * length, posY + yNormalized * length); //normalize
    float x0 = (1 - 5 * yNormalized)/xNormalized;
    float y0 = 5;
    float magnitude0 = sqrt((x0*x0) + (y0*y0));
    x0 /= magnitude0;
    y0 /= magnitude0;
    triangle(posX + xNormalized * length + x0 * 5, posY + yNormalized * length + y0 * 5, posX + xNormalized * length + x0 * -5, posY + yNormalized * length + y0 * -5, posX + xNormalized * length + xNormalized * 10, posY + yNormalized * length + yNormalized * 10);
  }
}

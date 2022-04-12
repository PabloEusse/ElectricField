class VectorField {
  public Vector2D[][] field;
  public int sizeX, sizeY;
  public float vectorDensity;
  public VectorField(int sizeX, int sizeY, float vectorDensity) {
    field = new Vector2D[int(vectorDensity * sizeX)][(int)(vectorDensity * sizeY)];
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.vectorDensity = vectorDensity;
    for(int i = 0 ; i < field.length ; i++){
      for(int o = 0 ; o < field[0].length ; o++) {
        field[i][o] = new Vector2D(10,10,i/vectorDensity, o/vectorDensity); //<>//
      }
    }
  }
  void calculateForce(Magnet[] magnets) {
    for(int i = 0 ; i < field.length ; i++){
      for(int o = 0 ; o < field[0].length ; o++) {
        Vector2D vector = field[i][o];
        vector.vec[0] = vector.vec[1] = 0;
        for(int k = 0 ; k < magnets.length ; k++){
          Magnet magnet = magnets[k];
          float x0 = magnet.posX - vector.posX;
          float y0 = magnet.posY - vector.posY;
          float magnitude = sqrt((x0*x0) + (y0*y0));
          x0 /= magnitude;
          y0 /= magnitude;
          vector.vec[0] += (x0*magnet.coefficient) / (magnitude*magnitude) * magnet.positive;
          vector.vec[1] += (y0*magnet.coefficient) / (magnitude*magnitude) * magnet.positive;
        }
      }
    }
  }
  void drawVectors(float length){
  for(int i = 0 ; i < field.length ; i++){
      for(int o = 0 ; o < field[0].length ; o++) {
        field[i][o].drawVector(length);
      }
    }
  }
}

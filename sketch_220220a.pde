void setup() {
  size(800,800);
  background(255);
  magnets[0] = new Magnet (400,400,100,1);
  magnets[1] = new Magnet (400,700,100,-1);
}
int x,y;
Magnet[] magnets = new Magnet[2];
VectorField field = new VectorField(800,800,0.03);
void draw() {
  background(255);
  magnets[0].posX = mouseX;
  magnets[0].posY = mouseY;
  field.calculateForce(magnets);
  field.drawVectors(15);
}

public void rotatingMagnets(){
  
}

void draw()
{
  background(100);
  update();
  render();
}

void update()
{
  PVector vel = PVector.sub(A, B); // velocity - FROM B TO A
  vel.div(50);
  B.add(vel);

  collide();
}

void collide()
{
  if (A.dist(B) < sensitivity) 
  { 
    reposition();
    death();
  }
}

void render()
{
  //translate(width/2, height/2);
  noFill();
  ellipse(B.x, B.y, 15, 15);
  translate(width/2, height/2);
  ellipse(0, 0, radius*2, radius*2);
}

PVector A, B, P;
int radius = 200;
float speed = 1;
int sensitivity = 10;
float angle;

void setup()
{
  size(500, 500);
  A = new PVector(width/2, height/2); // center
  B = new PVector();
  P = new PVector();
  reposition();
}

void reposition()
{
  //float angle = map(mouseX, 0, width, -PI, PI);
  angle = random(-PI, PI);  
  P.set(sin(angle)*radius+width/2, cos(angle)*radius+height/2);
  B.set(P.x, P.y);
}

void death()
{
}

void mousePressed()
{
  reposition();
}
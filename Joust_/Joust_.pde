import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 

ArrayList<Platform> platform;
ArrayList<Boundary> boundary;
ArrayList<Balance> balance;
Box2DProcessing box2d; 

float t = 320;
float f = 3*t;

void setup()
{
  fullScreen(); 
  smooth();
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  box2d.setGravity(0,-10);
  boundary = new ArrayList<Boundary>();
  boundary.add(new Boundary(width/4,height-5,width/2-50,10));
  boundary.add(new Boundary(3*width/4,height-5,width/2-50,10));
  platform = new ArrayList<Platform>();
  platform.add(new Platform(t, 500, 300, 20));
  platform.add(new Platform(f,500,300,20));
  balance = new ArrayList<Balance>();
  balance.add(new Balance(width/4, height-5, 20,500));
  balance.add(new Balance(3*width/4,height-5,20,500));
  
  
}

void draw()
{
  
  background(255);
  box2d.step();
  for(Boundary wall: boundary)
  {
    wall.display();
  }
  for(Balance pole: balance)
  {
    pole.display();
  }
  for(Platform land: platform)
  {
    land.display();
  }

}

void keyPressed()
{
  if(key == 'w');
  {
    t+=1;
  }
}
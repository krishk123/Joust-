import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 

Platform platform;  
Platform platform2;
Balance balance2;
Boundary boundary;
Balance balance;
Box2DProcessing box2d; 

void setup()
{
  fullScreen();
  background(0); 
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  boundary = new Boundary(0, 500, 5000, 10);
  platform = new Platform(100, 250, 400, 20);
  platform2 = new Platform(500,250,400,20);
  balance = new Balance(100,480, 20, 400);
  balance2 = new Balance(500,480,20,400);
  
  
}

void draw()
{
  box2d.step();
  boundary.display();
  balance.display();
  balance2.display();
  platform.display();
  platform2.display();
}
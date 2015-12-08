import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 

Platform platform;  
Box2DProcessing box2d; 

void setup()
{
  fullScreen();
  background(0); 
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  platform = new Platform(100, 0 , 300, 30 );
  
}

void draw()
{
  box2d.step();
  platform.display(); 
}
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 

ArrayList<Platform> platform;
ArrayList<Boundary> boundary;
ArrayList<Balance> balance;
ArrayList<Player> player;
ArrayList<Platform2> platform2; 
Box2DProcessing box2d;
float t = 320;
float f = 3*t;
PImage photo1; 

void setup()
{
  photo1 = loadImage("GladiatorArena.png");
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
  platform2 = new ArrayList<Platform2>();
  platform2.add(new Platform2(f, 500,300,20)); 
  balance = new ArrayList<Balance>();
  balance.add(new Balance(width/4, height-5, 20,500));
  balance.add(new Balance(3*width/4,height-5,20,500));
  player = new ArrayList<Player>();
  player.add(new Player(width/4, 300, 20, 50)); 
  player.add(new Player(3*width/4, 300, 20, 50));
  textSize(48);
  text("Joust!", width/2, height);
  print(width, height);
}

void draw()
{
  
  background(photo1); 
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
    land.movement();
  }
  for(Platform2 land2: platform2) 
  {
    land2.display();
    land2.movement();
  }
  for(Player character: player)
  {
    character.display();
  }
}
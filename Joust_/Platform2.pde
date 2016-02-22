class Platform2
{ 
  Body body; 
  float x;
  float y;
  float w;
  float h; 
  
  Platform2(float x_, float y_, float w_, float h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_; 

    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef(); 
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(255);
    rect(0,0,w,h);
    popMatrix();
  }
  void movement()
  {
    if (keyPressed == true)
    {
      if (key == 'g')
      {
        body.setLinearVelocity(new Vec2(3,0));
      }
      if (key == 'f')
      {
        body.setLinearVelocity(new Vec2(-3,0));
      }
    }
  }
}
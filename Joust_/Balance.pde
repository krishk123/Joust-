class Balance
{
  int x, y, w, h;
  Body body;
  Balance(int x_, int y_, int w_, int h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    bd.type = BodyType.STATIC;
    
    
    body = box2d.createBody(bd);
    PolygonShape ps = new PolygonShape(); 
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    
    ps.setAsBox(box2dW, box2dH); 
    
    body.createFixture(ps,1); 
  }
  
  void display()
  {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
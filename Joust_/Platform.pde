class Platform
{ 
  Body body; 
  float x;
  float y;
  float w;
  float h; 
  
  Platform(float x_, float y_, float w_, float h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_; 
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y)); 
    body = box2d.createBody(bd);
    PolygonShape ps = new PolygonShape(); 
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh); 
    FixtureDef fd = new FixtureDef(); 
    fd.shape = ps;
    fd.density = 1; 
    fd. friction = 0.3;
    fd.restitution = 0.5; 
  }
  
  void display()
  {
    rect(x, y, w, h);
  }
  
}
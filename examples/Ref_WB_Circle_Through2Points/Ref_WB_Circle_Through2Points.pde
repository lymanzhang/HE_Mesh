import wblut.processing.*;
import wblut.geom.*;
import java.util.List;

WB_GeometryFactory gf;
WB_Render2D render;

WB_Point point1;
WB_Point point2;
List<WB_Circle> circles;
float radius;

void setup() {
  size(800, 800);
  gf=WB_GeometryFactory.instance();
  render=new WB_Render2D(this);
  radius=200;
  point1= gf.createPoint(random(0, 400),random(0, 400));
  point2= gf.createPoint(random(100, 300),random(-300, -100));
}

void create() {
  radius=mouseX;
  circles=gf.createCircleThrough2Points(point1,point2,radius);
}

void draw() {
  background(255);
  translate(400,400);
  create();
  noFill();
  stroke(255,0,0, 120);
  for(WB_Circle circle:circles){
  render.drawCircle2D(circle);
  }
  stroke(0, 120);
  render.drawPoint2D(point1,5);
  render.drawPoint2D(point2,5);
}


void mousePressed(){
  point1= gf.createPoint(random(0, 400),random(0, 400));
  point2= gf.createPoint(random(100, 300),random(-300, -100));
}
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;
int B, C;
void setup() {
  size(800, 800, P3D);
  smooth(8);
  B=1;
  C=0;
  HEC_Geodesic creator=new HEC_Geodesic();
  creator.setRadius(200); 
  // http://stackoverflow.com/questions/3031875/math-for-a-geodesic-sphere
  // N=B+C=number of divisions
  // B=N and C=0 or B=0 and C=N: class I
  // B=C=N/2: class II
  // Other: class III 
  creator.setB(B);
  creator.setC(C);

  // class I, II and III: TETRAHEDRON,OCTAHEDRON,ICOSAHEDRON
  // class II only: CUBE, DODECAHEDRON
  creator.setType(HEC_Geodesic.ICOSAHEDRON);
  mesh=new HE_Mesh(creator); 
  render=new WB_Render(this);
}

void draw() {
  background(55);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  text("B="+B+" C="+C,50,750);
  translate(width/2, height/2, 0);
  rotateY(map(mouseX, 0, width, -PI/2, PI/2));
  rotateX(map(mouseY, 0, height, PI/2, -PI/2));
  noStroke();
  fill(255);
  render.drawFaces(mesh);
  noFill();
  strokeWeight(1);
  stroke(0);
  render.drawEdges(mesh);
}

void mousePressed() {
  if (mouseX<width/2) B++;
  if (mouseX>width/2) C++;

  HEC_Geodesic creator=new HEC_Geodesic();
  creator.setRadius(200); 
  creator.setB(B);
  creator.setC(C);
  creator.setType(HEC_Geodesic.ICOSAHEDRON);
  mesh=new HE_Mesh(creator);
}
PShape A,B,C,D,E;
PImage bg;
float rotX,rotY;
float rotMonth,rotDay,rotHour,rotMinute,rotSecond;

void setup(){
  size(1200,760,P3D);
  smooth();
  frameRate(10);
  A=loadShape("moon.obj");
  B=loadShape("earth.obj");
  C=loadShape("MarsPlanet.obj");
  D=loadShape("AlienPlanet.obj");
  E=loadShape("yavin.obj");
  bg=loadImage("star.jpg");
  bg.resize(width, height);
  
  A.setAmbient(color(0,0,0.5));
  B.setAmbient(color(0,0,0.5));
  C.setAmbient(color(0,0,0.5));
  D.setAmbient(color(0,0,0.5));
  E.setAmbient(color(0,0,0.5));
}

void draw(){
  background(bg);
  int myMonth=month();
  int myDay=day();
  int myHour=hour();
  int myMinute=minute();
  int mySecond=second();
  float monthPrc=(float)myMonth/12;
  float dayPrc=(float)myDay/31;
  float hourPrc=(float)myHour/24;
  float minutePrc=(float)myMinute/60;
  float secondPrc=(float)mySecond/60;
  
  // position
  float monthAngle=monthPrc*-360-90;
  float dayAngle=dayPrc*-360-90;
  float hourAngle=hourPrc*-360-90;
  float minuteAngle=minutePrc*-360-90;
  float secondAngle=secondPrc*-360-90;
  
  // distance from center
  float monthR=350;
  float dayR=280;
  float hourR=200;
  float minuteR=120;
  float secondR=50;

  // time goes backwards
  float monthX=cos(radians(monthAngle))*monthR;
  float monthY=sin(radians(monthAngle))*monthR;
  float dayX= cos(radians(dayAngle))*dayR;
  float dayY= sin(radians(dayAngle))*dayR;
  float hourX= cos(radians(hourAngle))*hourR;
  float hourY= sin(radians(hourAngle))*hourR;
  float minuteX= cos(radians(minuteAngle))*minuteR;
  float minuteY= sin(radians(minuteAngle))*minuteR;
  float secondX= cos(radians(secondAngle))*secondR;
  float secondY= sin(radians(secondAngle))*secondR;
 
  // drawing arc
  pushMatrix();
  translate(width/2,height/2);
  rotateX(rotX);
  rotateY(rotY);
  rotateX(HALF_PI-0.5);
  noFill();
  strokeWeight(3);
  stroke(50, 120);
  ellipse(0,0,700,700);
  strokeWeight(2.5);
  stroke(100, 120);
  ellipse(0,0,560,560);
  strokeWeight(2);
  stroke(150, 120);
  ellipse(0,0,400,400);
  strokeWeight(1.5);
  stroke(200, 120);
  ellipse(0,0,240,240);
  strokeWeight(1);
  stroke(250, 120);
  ellipse(0,0,100,100);
  
  // drawing connection line
  stroke(150,150,150,90);
  strokeWeight(1);
  line(monthX,monthY,dayX,dayY);
  line(dayX,dayY,hourX,hourY);
  line(hourX,hourY,minuteX,minuteY);
  line(minuteX,minuteY,secondX,secondY);
  line(secondX,secondY,0,0);

  // setting light
  lights();
  pointLight(200,200,200,0,0,0);

  // drawing planets
  noStroke();
  
  // E
  pushMatrix();
  translate(monthX,monthY);
  rotateZ(rotMonth+=0.01);
  translate(-30,0,0);
  scale(0.7);
  shape(E);
  popMatrix();
  
  // D
  pushMatrix();
  translate(dayX,dayY);
  translate(0,10,0);
  rotateZ(rotDay-=0.03);
  translate(0,-10,0);
  scale(15);
  shape(D);
  popMatrix();
  
  // C
  pushMatrix();
  translate(hourX,hourY);
  rotateZ(rotHour+=0.04);
  scale(1.9);
  shape(C);
  popMatrix();
  
  // B
  pushMatrix();
  translate(minuteX,minuteY);
  rotateZ(rotMinute-=0.05);
  scale(0.06);
  shape(B);
  popMatrix();
  
  // A
  pushMatrix();
  translate(secondX,secondY);
  rotateZ(rotSecond+=0.06);
  scale(0.2);
  shape(A);
  popMatrix();
  
  popMatrix();
}

void mouseDragged(){
  rotX+=map(pmouseY-mouseY,0,1,0,PI/500.0f);
  rotY+=map(pmouseX-mouseX,0,1,0,-PI/500.0f);
}
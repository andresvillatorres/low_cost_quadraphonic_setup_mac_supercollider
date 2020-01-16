/*

Zurich, 16th January 2020
Written by ndr3svt (Andrés Villa Torres)

Visualisation of two spinning sound sources in a four channel audio setup
For low cost quadraphonic setup in a mac using supercollider and aggregate devices
Art, education and research

*/
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
void setup(){

	size(400,400,FX2D);
	background(0);
	frameRate(120);
	 oscP5 = new OscP5(this,7777);
}
float x=0;
float y=0;
float x2=0;
float y2=0;

void draw(){
	background(0);
	noStroke();
	fill(255,0,0);
	rectMode(CENTER);
	ellipse(width/2 + (x*70),height/2 + (-y*70) ,10,10);

	textAlign(CENTER);
	text("F",width/2,100);
	text("B",width/2,height-100);
	text("L",100,height/2);
	text("R",width-100,height/2);
	text("fps : " + frameRate,width/2,25);
	text("x : " + nf(x,0,2) + ", y : "+ nf(y,0,2),width/2,height-40);

	fill(0,0,255);
	ellipse(width/2 + (x2*70),height/2 + (-y2*70) ,10,10);
	text("x : " + nf(x2,0,2) + ", y : "+ nf(y2,0,2),width/2,height-20);	

	fill(255);
	noFill();
	stroke(255);
	strokeWeight(0.5);
	ellipse(width/2,height/2,100,100);
}
void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.checkAddrPattern("/circlePan4")==true) {

      float _x = theOscMessage.get(0).floatValue();
      float _y = theOscMessage.get(1).floatValue();

      x=_x;
      y=_y;

      return;
  } 
  if(theOscMessage.checkAddrPattern("/circlePan4_2")==true) {

      float _x = theOscMessage.get(0).floatValue();
      float _y = theOscMessage.get(1).floatValue();

      x2=_x;
      y2=_y;

      return;
  } 

}
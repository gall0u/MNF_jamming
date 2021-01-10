//1.Create Line's object per line
Line Fin;
Line DeuxMillesVingt;

PFont MNF;
PFont MNF_Dot;


void setup() {
  MNF = loadFont("ManifontGroteskBook-70.vlw");
  MNF_Dot = loadFont("ManifontGroteskBookDot-70.vlw");
  //2.Size your canvas
  size(350, 450);
}

void draw() {
  background(255);
  //3.Choose the framerate of your animation -> if this is just an image move it all to setup loop
  frameRate(30);
  fill(0);
  textFont(MNF, 70);
  //4.Call your Lines with your "text" + y position
  text("YES!", 100, 370);
  Fin = new Line(" FIN", 130);
  DeuxMillesVingt = new Line("2020,", 250);
}

class Line {

  String txt;
  int lineH;
  int iteration;
  int lineColor;

  Line(String txt, int lineH) {

    this.txt=txt;
    this.lineH=lineH;

    fill(0);
    textFont(MNF, 70);
    text(txt, 100, lineH);
    //5.Choose the number of iteration per color
    jamming(5, 0);
    jamming(50, 255);
  }
  void jamming(int iteration, int lineColor) {

    for ( int j=0; j<iteration; j=j+1) {

      pushMatrix();

      for (int i=0; i<txt.length(); i=i+1) {

        char x = txt.charAt(i);
        //6.At least choose the range of movement in which point typography will randomly move
        translate(random(30, 50), random(-10, 10));
        textFont(MNF_Dot, 70);
        fill(lineColor);
        text(x, 50, lineH);
      }

      popMatrix();
    }
  }
}

// May 12, 2014
// Luke Vanden Broek
// Rock, Paper, Scissors

// Naming images
PImage sc;
PImage rk;
PImage pp;
PImage sc2;
// game types
boolean allGame=true;// applies to either mode
boolean game1=true;// only applies to single player
boolean game2=true;// only applies to multiplayer
//colour
int c1=50;
int c2=50;
// random ai
float r= 0;
int m=millis();
int interval= 1000;
float time=0;
int j=0;
// multiplayer variables
int mprk1=0;
int mppp1=0;
int mpsc1=0;
int mprk2=0;
int mppp2=0;
int mpsc2=0;


void setup () {
  // background
  size (1000, 500);
  colorMode(HSB, 360, 100, 100);
  // font
  textSize (50);
  // random pics
  sc = loadImage ("hasami.png");
  rk = loadImage ("alpine-landscape-cone-top-rock-01b-al1.png");
  pp = loadImage ("Gerald-G-Parchment-Background-or-Border-1.png");
  sc2 = loadImage ("hasami copy.png");
}
void draw () {
  // menu
  background (200, 100, 100);
  fill (50, c1, 100);
  if (mouseX>100&&mouseY>150&&mouseX<400&&mouseY<550) {
    c1=100;
  } else {
    c1=50;
  }
  if (mouseX>600&&mouseX<900&&mouseY>150&&mouseY<550) {
    c2=100;
  } else {
    c2=50;
  }
  rect(100, 150, 300, 300);
  fill(300, c2, 100);
  rect (600, 150, 300, 300);
  textSize(50);
  fill (0);
  text ("Rock, Paper, Scissors", 250, 100);
  textSize(150);
  text ("1P", 165, 350);
  text ("2P", 660, 350);

  if (!allGame) {
    if (!game1) {
      background (50, 100, 100);
      if (keyPressed) {
        if (key=='1'||key=='2'||key=='3') {
          {
            if (millis() - m > interval)
            {
              time++;
              m = millis();
            }
            if (time==1) {
              r=random(3);
              time=1;
            } else {
              time=0;
            }
          }
        } else {
          r=0;
          time=0;
        }
        if (r<=3&&r>2) {
          image(rk, 600, 0);
        }
        if (r<=2&&r>1) {
          image(pp, 500, 100);
        }
        if (r<=1&&r>0) {
          image(sc2, 500, 100);
        }
      }

      if (keyPressed&&key=='1') {
        image(rk, 100, 0);
      }
      if (keyPressed&&key=='2') {
        image(pp, 100, 100);
      }
      if (keyPressed&&key=='3') {
        image(sc, 0, 100);
      }
      if (keyPressed&&key=='1') {
        if (r<=3&&r>2&&time==0) {
          fill (360);
          text ("TIE!", 350, 300);
        }
        if (r<=2&&r>1&&time==0) {
          fill (0, 100, 100);
          text ("YOU LOSE!", 150, 300);
        }
        if (r<=1&&r>0&&time==0) {
          fill (100, 100, 100);
          text ("YOU WIN!", 150, 300);
        }
      }
      if (keyPressed&&key=='2') {
        if (r<=3&&r>2&&time==0) {
          fill (100, 100, 100);
          text ("YOU WIN!", 150, 300);
        }
        if (r<=2&&r>1&&time==0) {
          fill (360);
          text ("TIE!", 350, 300);
        }
        if (r<=1&&r>0&&time==0) {
          fill (0, 100, 100);
          text ("YOU LOSE!", 150, 300);
        }
      }    
      if (keyPressed&&key=='3') {
        if (r<=3&&r>2&&time==0) {
          fill (0, 100, 100);
          text ("YOU LOSE!", 150, 300);
        }
        if (r<=2&&r>1&&time==0) {
          fill (100, 100, 100);
          text ("YOU WIN!", 150, 300);
        }
        if (r<=1&&r>0&&time==0) {
          fill (360);
          text ("TIE!", 350, 300);
        }
      }
    } else if (!game2) {
      background (300, 100, 100);
      if (mprk1==0&&mppp1==0&&mpsc1==0) {
        if (keyPressed&&key=='1') {
          mprk1=1;
        }
        if (keyPressed&&key=='2') {
          mppp1=1;
        }
        if (keyPressed&&key=='3') {
          mpsc1=1;
        }
      }
      if (mprk2==0&&mppp2==0&&mpsc2==0) {
        if (keyPressed&&key=='4') {
          mprk2=1;
        }
        if (keyPressed&&key=='5') {
          mppp2=1;
        }
        if (keyPressed&&key=='6') {
          mpsc2=1;
        }
      }
      if (mprk1==1&&mprk2==1) {
        image(rk, 100, 0);
        image(rk, 600, 0);
        fill (360);
        text ("TIE!", 350, 300);
      }
      if (mprk1==1&&mppp2==1) {
        image(rk, 100, 0);
        image(pp, 500, 100);
        fill (200, 100, 100);
        text ("P2 WINS!", 150, 300);
      }
      if (mprk1==1&&mpsc2==1) {
        image(rk, 100, 0);
        image(sc2, 500, 100);
        fill (30, 100, 100);
        text ("P1 WINS!", 150, 300);
      }
      if (mppp1==1&&mprk2==1) {
        image (pp, 100, 100);
        image (rk, 600, 0);
        fill (30, 100, 100);
        text ("P1 WINS!", 150, 300);
      }
      if (mppp1==1&&mppp2==1) {
        image (pp, 100, 100);
        image (pp, 500, 100);
        fill (360);
        text ("TIE!", 350, 300);
      }
      if (mppp1==1&&mpsc2==1) {
        image (pp, 100, 100);
        image (sc2, 500, 100);
        fill (200, 100, 100);
        text ("P2 WINS!", 150, 300);
      }
      if (mpsc1==1&&mprk2==1) {
        image (sc, 0, 100);
        image (rk, 600, 0);
        fill (200, 100, 100);
        text ("P2 WINS!", 150, 300);
      }
      if (mpsc1==1&&mppp2==1) {
        image (sc, 0, 100);
        image (pp, 500, 100);
        fill (30, 100, 100);
        text ("P1 WINS!", 150, 300);
      }
      if (mpsc1==1&&mpsc2==1) {
        image (sc, 0, 100);
        image (sc2, 500, 100);
        fill (360);
        text ("TIE!", 350, 300);
      }
      if (keyPressed&&key!='1'&&key!='2'&&key!='3'&&key!='4'&&key!='5'&&key!='6') 
      {
        mprk1=0;
        mppp1=0;
        mpsc1=0;
        mprk2=0;
        mppp2=0;
        mpsc2=0;
      }
    }
  }
}
void keyPressed() {
  if (allGame) {
    if (key=='1') {
      image(rk, 100, 0);
    }
    if (key=='2') {
      image(pp, 100, 100);
    }
    if (key=='3') {
      image(sc, 0, 100);
    }
    if (!game2) {
      if (keyPressed&&key=='4') {
        image(rk, 500, 0);
      }
      if (keyPressed&&key=='5') {
        image(pp, 500, 100);
      }
      if (keyPressed&&key=='6') {
        image(sc2, 500, 100);
      }
    }
  }
}

void mouseClicked() {
  // game1 selected
  if (mouseX>100&&mouseY>150&&mouseX<400&&mouseY<550)
  {    
    if (allGame) {
      allGame=true;
      game1=true;
    }
  }
  // otherwise make it false
  else if (game1) {
    allGame=false;
    game2=false;
  }

  // game2 selected
  if (mouseX>600&&mouseX<900&&mouseY>150&&mouseY<550)
  {    
    if (allGame) {
      allGame=true;
      game2=true;
    }
  }
  // otherwise make it true
  else if (game2) {
    allGame=false;
    game1=false;
  }
}

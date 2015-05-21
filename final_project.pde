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
  background (200, 100, 300);
  fill (100, c1, 100);
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
  fill(0, c2, 100);
  rect (600, 150, 300, 300);
  textSize(50);
  fill (0);
  text ("Rock, Paper, Scissors", 250, 100);
  textSize(150);
  text ("1P", 165, 350);
  text ("2P", 660, 350);

  if (!allGame) {
    if (!game1) {
      background (100, 100, 100);
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
    } else if (!game2) {
      background (0, 100, 100);
      if (keyPressed&&key=='4') {
        image(rk, 600, 0);
      }
      if (keyPressed&&key=='5') {
        image(pp, 500, 100);
      }
      if (keyPressed&&key=='6') {
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
    fill (360);
    if (keyPressed&&key=='1') {
      if (r<=3&&r>2&&time==0) {
        text ("TIE!", 350, 300);
      }
      if (r<=2&&r>1&&time==0) {
        text ("YOU LOSE!", 150, 300);
      }
      if (r<=1&&r>0&&time==0) {
        text ("YOU WIN!", 150, 300);
      }
    }
    if (keyPressed&&key=='2') {
      if (r<=3&&r>2&&time==0) {
        text ("YOU WIN!", 150, 300);
      }
      if (r<=2&&r>1&&time==0) {
        text ("TIE!", 350, 300);
      }
      if (r<=1&&r>0&&time==0) {
        text ("YOU LOSE!", 150, 300);
      }
    }    
    if (keyPressed&&key=='3') {
      if (r<=3&&r>2&&time==0) {
        text ("YOU LOSE!", 150, 300);
      }
      if (r<=2&&r>1&&time==0) {
        text ("YOU WIN!", 150, 300);
      }
      if (r<=1&&r>0&&time==0) {
        text ("TIE!", 350, 300);
      }
    }
  }
  // if (keyPressed&&key=='r') {
  //   if (allGame) {
  //     allGame=false;
  //     game1=false;
  //     game2=false;
  //   }
  //   if (game1) {
  //     allGame=false;
  //     game1=false;
  // }
  //   if (game2) {
  //     allGame=false;
  //     game2=false;
  //   }
  // }
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

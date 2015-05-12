// May 12, 2014
// Luke Vanden Broek
// Rock, Paper, Scissors

// game types
boolean allGame=true;// applies to either mode
boolean game1=true;// only applies to single player
boolean game2=true;// only applies to multiplayer
// random pics


void setup () {
  // background
  size (1000, 500);
  colorMode(HSB, 360, 100, 100);
  // font
  textSize (50);
}
void draw () {
  background (200, 100, 300);
  fill (20, 100, 100);
  rect(100, 150, 300, 300);
  fill(290, 100, 100);
  rect (600, 150, 300, 300);
  textSize(50);
  text ("Rock, Paper, Scissors", 250, 100);
  fill (0);
  textSize(150);
  text ("1P", 165, 350);
  text ("2P", 660, 350);
  if (!allGame) {
    if (!game1) {
      background (100, 100, 100);
    } else if (!game2) {
      background (0, 100, 100);
    }
  }
}
void mouseClicked(){
  // game1 selected
  if (mouseX>100&&mouseY>150&&mouseX<400&&mouseY<550)
  {    
    if (allGame) {
      allGame = true;
      game1=true;
    }
  }
  // otherwise make it false
  else if (game1) {
    allGame = false;
    game2=false;
  }

  // game2 selected
  if (mouseX>600&&mouseX<900&&mouseY>150&&mouseY<550)
  {    
    if (allGame) {
      allGame = true;
      game2=true;
    }
  }
  // otherwise make it true
  else if (game2) {
    allGame = false;
    game1=false;
  }
}

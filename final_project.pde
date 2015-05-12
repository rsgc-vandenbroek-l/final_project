// May 12, 2014
// Luke Vanden Broek
// Rock, Paper, Scissors

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
  text ("1P",165,350);
  text ("2P",660,350);
}

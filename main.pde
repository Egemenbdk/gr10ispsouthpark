int screenState = 0;

class Button {
  float x, y, w, h;
  String label;

  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }

  void display() {
    fill(255,200,0);
    stroke(0); strokeWeight(2);
    rect(x,y,w,h,10);
    fill(0); noStroke();
    textAlign(CENTER,CENTER);
    textSize(20);
    text(label, x+w/2, y+h/2);
  }

  boolean isClicked(float mx, float my) {
    return mx > x && mx < x+w && my > y && my < y+h;
  }
}

Button[] scenes = new Button[6];

void setup() {
  size(800, 500);
  noStroke();

  for (int i=0; i<6; i++)
    scenes[i] = new Button(300, 200 + i*50, 200, 40, "Scene " + (i+1));
}

void draw() {

  if (screenState == 0) menu();

  else if (screenState == 1) tentScene();
  else if (screenState == 2) scene2();
  else if (screenState == 10) scene1();

  else if (screenState == 11) arrivalScene();
  else if (screenState == 12) tentSetupScene();
  else if (screenState == 13) nightAnimalScene();
  else if (screenState == 14) campfireScene();
  else if (screenState == 15) cleanupScene();
  else if (screenState == 16) packupScene();
}


void mousePressed() {

  if (screenState == 0) {
    for (int i=0; i<6; i++) {
      if (scenes[i].isClicked(mouseX, mouseY)) {

        if (i == 0) screenState = 11;  // Scene 1 - arrival
        if (i == 1) screenState = 12;  // Scene 2 - tent setup
        if (i == 2) screenState = 13;  // Scene 3 - night + animals
        if (i == 3) screenState = 14;  // Scene 4 - campfire
        if (i == 4) screenState = 15;  // Scene 5 - cleanup
        if (i == 5) screenState = 16;  // Scene 6 - packup

      }
    }
  }
 
  else if (mouseX > 10 && mouseX < 90 && mouseY > 10 && mouseY < 40) {
    screenState = 0;
  }
}

void menu() {

  for (int y=0; y<height; y++) {
    int c = lerpColor(color(255,120,50), color(255,200,150), map(y,0,height,0,1));
    stroke(c);
    line(0,y,width,y);
  }

  noStroke();
  fill(255,180,0);
  ellipse(15,15,120,120);
  fill(255,211,105);
  ellipse(15,15,100,100);

  fill(50,100,40);
  rect(0,height-100,width,100);

  fill(30,80,30);
  for (int i=0; i<width; i+=80) {
    rect(i+20,300,20,100);
    fill(20,120,40);
    ellipse(i+30,300,80,80);
    fill(30,80,30);
  }

  fill(255,220,0);
  textSize(50);
  textAlign(CENTER,CENTER);
  text("Main Menu", width/2, 80);

  for (Button b : scenes) b.display();
}

void backBtn() {
  fill(255,100,100);
  stroke(0); strokeWeight(2);
  rect(10,10,80,30,8);
  fill(0); noStroke();
  textAlign(CENTER,CENTER);
  textSize(16);
  text("BACK",50,25);
}

void scene1() {
  background(110,170,120);

  for (int i=0; i<10; i++) {
    float x=i*80+20;
    fill(100,140,90); rect(x,120,40,200);
    fill(70,110,70); ellipse(x+20,120,120,140);
  }
  fill(60,120,70);
  ellipse(150,280,160,80);
  ellipse(300,290,200,100);

  fill(160,190,110);
  rect(0,300,width,200);

  drawLady(80,260);
  drawCar(550,260);

  drawKid1(520,330);
  drawKid2(560,330);
  drawKid3(600,330);

  backBtn();
}

void scene2() {
  background(140,180,130);

  for (int i=0; i<12; i++) {
    float x=i*70+20;
    fill(50,70,40); rect(x,130,25,180);
    fill(80,110,70); ellipse(x+12,130,100,130);
  }

  fill(80,120,70);
  ellipse(120,320,180,110);
  ellipse(280,330,220,130);

  fill(190,210,160);
  rect(0,340,width,height-340);

  drawYellowTent(width/2,300);
  drawCarScene2(650,360);

  drawCharacterKyle(220,360);
  drawCharacterCartman(400,380);
  drawCharacterKenny(530,370);
  drawCharacterWoman(70,350);

  backBtn();
}

void tentScene() {
  background(255);

  fill(245,205,50); rect(0,0,width,height);
  fill(250,220,80); ellipse(width/2,100,600,260);
  fill(240,200,60); triangle(width/2,60,120,height,width-120,height);
  fill(40,110,140); rect(0,260,width,260);
  fill(30,90,120,150); ellipse(width/2,350,800,220);

  drawLantern(150,320);
  drawSleeperLeft(280,330);
  drawSleeperMiddle(360,330);
  drawSleeperHood(440,330);
  drawBackpack(540,290);

  backBtn();
}

void arrivalScene() {
  background(110,170,120);

  for (int i=0; i<10; i++) {
    float x=i*80+20;
    fill(90,130,80); rect(x,120,40,180);
    fill(70,110,70); ellipse(x+20,120,110,140);
  }

  fill(160,190,110);
  rect(0,300,width,200);

  drawCar(550,260);

  drawCharacterCartman(480,330);
  drawCharacterKyle(520,330);
  drawCharacterKenny(560,330);

  fill(0);
  textSize(24);
  text("Cartman, Kyle and Kenny arrive for camping.", width/2, 40);

  backBtn();
}
void tentSetupScene() {
  background(140,180,130);

  for (int i=0; i<12; i++) {
    float x=i*70+20;
    fill(50,70,40); rect(x,130,25,180);
    fill(80,110,70); ellipse(x+12,130,100,130);
  }

  fill(190,210,160);
  rect(0,340,width,height-340);

  drawYellowTent(width/2,300);

  drawCharacterKyle(260,360);
  drawCharacterCartman(400,360);
  drawCharacterKenny(540,360);

  fill(0);
  textSize(24);
  text("They set up the tent together.", width/2, 40);

  backBtn();
}

void nightAnimalScene() {
  background(20,30,60);
  fill(0,0,0,120);
  rect(0,0,width,height);

  fill(120,60,20);
  triangle(width/2-100,320,width/2+100,320,width/2,200);

  drawSleeperLeft(300,350);
  drawSleeperMiddle(380,350);
  drawSleeperHood(460,350);

  int animal = (int)random(2);

  fill(255);
  textSize(26);

  if (animal == 0) {
    fill(80,50,30);
    ellipse(200,330,120,90);
    ellipse(170,300,40,40);
    ellipse(230,300,40,40);
    text("A bear approaches the tent...", width/2, 70);
  } else {
    fill(230);
    ellipse(200,340,60,40);
    ellipse(180,315,20,40);
    ellipse(220,315,20,40);
    text("A rabbit hops near the tent...", width/2, 70);
  }

  backBtn();
}

// ------------------------------------------------------
// NEW STORY SCENE 4 — MORNING CAMPFIRE
// ------------------------------------------------------

void campfireScene() {
  background(135,185,155);

  // Sky glow
  fill(255,230,180,120);
  ellipse(width/2,80,600,200);

  // Trees
  for (int i=0; i<10; i++) {
    float x = i*80;
    fill(80,110,70);
    rect(x+30,120,30,190);
    fill(60,140,80);
    ellipse(x+45,120,130,130);
  }

  // Ground
  fill(170,215,170);
  rect(0,340,width,160);

  // Fire pit stones
  fill(140);
  ellipse(400,360,180,70);
  fill(160);
  ellipse(400,355,150,50);

  // Logs
  fill(110,70,30);
  rect(350,350,90,15,6);
  rect(395,340,90,15,6);

  // Fire (layered flames)
  fill(255,140,0);
  ellipse(400,315,90,120);
  fill(255,200,0);
  ellipse(385,325,50,80);
  ellipse(415,325,50,80);

  // Smoke
  fill(200,200,200,140);
  ellipse(400,270,45,35);
  ellipse(420,245,35,30);
  ellipse(390,230,25,25);

  // Marshmallow sticks
  stroke(90,60,30);
  strokeWeight(4);
  line(260,350,330,320);
  line(540,350,470,320);
  noStroke();
  fill(255);
  ellipse(330,320,12,12);
  ellipse(470,320,12,12);

  // Characters
  drawCharacterKyle(260,360);
  drawCharacterCartman(400,360);
  drawCharacterKenny(540,360);

  // Story text
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("They gather around the campfire, roasting marshmallows\nand enjoying the quiet morning.", 
       width/2, 90);

  backBtn();
}


// ------------------------------------------------------
// NEW STORY SCENE 5 — CLEAN UP
// ------------------------------------------------------

void cleanupScene() {
  background(160,205,170);

  // Trees
  for (int i=0; i<10; i++) {
    float x=i*80;
    fill(70,110,60);
    rect(x+30,120,30,180);
    fill(50,130,70);
    ellipse(x+45,120,110,110);
  }

  // Ground
  fill(180,220,180);
  rect(0,340,width,160);

  // Fire pit (ashes)
  fill(130);
  ellipse(400,360,160,60);
  fill(90);
  ellipse(400,350,60,30);

  // Trash bag
  fill(40);
  ellipse(480,350,50,60);
  fill(60);
  rect(465,315,30,20,5);

  // Characters
  drawCharacterKyle(260,360);
  drawCharacterCartman(400,360);
  drawCharacterKenny(540,360);

  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("They clean up the campsite and put out the fire safely.", width/2, 60);

  backBtn();
}

// ------------------------------------------------------
// NEW STORY SCENE 6 — PACK UP & LEAVE
// ------------------------------------------------------

void packupScene() {
  background(120,170,140);

  // Trees
  for (int i=0; i<9; i++) {
    float x=i*90;
    fill(70,120,80);
    rect(x+40,120,30,180);
    fill(50,150,90);
    ellipse(x+55,120,120,120);
  }

  // Road
  fill(100);
  rect(0,360,width,60);
  stroke(255);
  for (int i=0; i<width; i+=60)
    line(i,390,i+30,390);
  noStroke();

  // Car
  drawCar(550,260);
  fill(80);
  rect(520,220,120,25,8); // luggage

  // Characters
  drawCharacterKyle(420,340);
  drawCharacterCartman(470,340);
  drawCharacterKenny(520,340);

  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("They pack up, say goodbye to the campsite, and head home.", width/2, 60);

  backBtn();
}
 

// ------------------------------------------------------
// ALL DRAWING HELPERS (YOUR ORIGINAL ART)
// ------------------------------------------------------

void drawLady(float x, float y) {
  fill(200,230,255); rect(x-20,y,40,70,10);
  fill(255,220,190); ellipse(x,y-25,45,45);
  fill(0); ellipse(x-8,y-28,5,5); ellipse(x+8,y-28,5,5);
  fill(180,140,100); ellipse(x,y-35,50,35);
  fill(200,60,60); rect(x-22,y+60,44,40);
}

void drawCar(float x, float y) {
  fill(40); rect(x-80,y,160,70,10);
  fill(20); rect(x-80,y-40,160,40,5);
}

void drawKid1(float x, float y) {
  fill(255,220,180); ellipse(x,y-25,35,35);
  fill(20,150,20); rect(x-20,y,40,40,8);
  fill(80,170,220); ellipse(x,y-40,45,25);
}

void drawKid2(float x, float y) {
  fill(220,90,40); ellipse(x,y-20,55,55);
  fill(255,220,180); ellipse(x,y-20,35,35);
  fill(250,130,30); rect(x-20,y,40,40,8);
}

void drawKid3(float x, float y) {
  fill(255,220,180); ellipse(x,y-25,35,35);
  fill(200,20,20); rect(x-20,y,40,40,8);
  fill(240,230,40); ellipse(x,y-40,45,25);
}

void drawYellowTent(float x, float y) {
  noStroke();
  fill(255,190,0);
  triangle(x-110,y+60,x+110,y+60,x,y-50);
  fill(230,170,0);
  triangle(x-20,y+10,x+20,y+10,x,y-50);
  stroke(200,140,0); strokeWeight(3);
  for (int i=-80; i<=80; i+=40) line(x+i,y+60,x+i,y+90);
  noStroke();
}

void drawCarScene2(float x, float y) {
  fill(20,30,20); rect(x-80,y,160,60,12);
  fill(10,15,10); rect(x-70,y-40,140,40,8);
  fill(60); ellipse(x-50,y+60,40,40); ellipse(x+50,y+60,40,40);
  fill(100,120,90); rect(x-50,y+30,100,15,6);
}

void drawCharacterKyle(float x, float y) {
  fill(60,140,60); ellipse(x,y-40,70,70);
  fill(255,220,180); ellipse(x,y-40,50,50);
  fill(240,140,30); rect(x-30,y-10,60,50,10);
}

void drawCharacterCartman(float x, float y) {
  fill(255,200,60); ellipse(x,y-40,90,90);
  fill(255,220,180); ellipse(x,y-40,65,65);
  fill(220,50,20); rect(x-40,y-10,80,55,15);
}

void drawCharacterKenny(float x, float y) {
  fill(240,110,20); ellipse(x,y-40,85,85);
  fill(255,220,180); ellipse(x,y-40,55,55);
  fill(240,110,20); rect(x-30,y-10,60,50,12);
}

void drawCharacterWoman(float x, float y) {
  fill(80,120,140); rect(x-25,y-40,50,70,8);
  fill(255,220,180); ellipse(x,y-70,45,45);
  fill(80,40,40); arc(x,y-75,50,60,PI,TWO_PI);
  fill(0); ellipse(x-8,y-70,7,7); ellipse(x+8,y-70,7,7);
}

void drawLantern(float x, float y) {
  fill(220,40,30); ellipse(x,y+50,90,45);
  fill(240,240,240,180); rect(x-25,y-10,50,70,10);
  fill(220,40,30); ellipse(x,y-5,70,35);
}

void drawSleeperLeft(float x, float y) {
  fill(150,150,160); ellipse(x,y+55,110,70);
  fill(230,205,180); ellipse(x,y,85,85);
  fill(130,130,130); arc(x,y-15,95,75,PI,TWO_PI);
  stroke(70); strokeWeight(4);
  line(x-20,y+10,x-5,y+18);
  line(x+20,y+10,x+5,y+18);
  noStroke();
}

void drawSleeperMiddle(float x, float y) {
  fill(80,160,200); ellipse(x,y+55,110,70);
  fill(230,205,180); ellipse(x,y,85,85);
  fill(40,150,40); arc(x,y-15,95,75,PI,TWO_PI);
  stroke(70); strokeWeight(4);
  line(x-20,y+10,x-5,y+18);
  line(x+20,y+10,x+5,y+18);
  noStroke();
}

void drawSleeperHood(float x, float y) {
  fill(160,80,40); ellipse(x,y+55,110,70);
  fill(220,80,20); ellipse(x,y,105,105);
  fill(230,205,180); ellipse(x,y,70,70);
  stroke(70); strokeWeight(4);
  line(x-15,y,x-5,y+10);
  line(x+15,y,x+5,y+10);
  noStroke();
}

void drawBackpack(float x, float y) {
  fill(70,90,60); rect(x,y,120,150,20);
  fill(110,140,95); rect(x+20,y+30,80,50,15);
  rect(x+20,y+90,80,45,15);
  fill(240); rect(x+90,y+20,30,90,10);
  fill(140,200,240); rect(x+95,y+35,20,50,8);
} 

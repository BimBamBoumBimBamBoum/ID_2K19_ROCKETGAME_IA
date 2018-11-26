import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ia extends PApplet {

Fusee c2;
FuseeDeux c5;
cercle c1;
Etoiles c3;
Logo c6;
//Planet c4;

boolean end = false;

boolean go_planet = false ;
// Mouvement sur l'axe Y des planetes
float my;

// Etoiles 
int nb_star = (int)random(50, 100);
Star [] tab_star = new Star[nb_star];

// Tableaux de 10 planètes
//int nbPlanet = 5;

Planet[] lalunetombe = new Planet[1];


boolean go_fume = false;
Smoke[] smokesmoke = new Smoke[100];

boolean go_tir = false;
Tir[] tirletsgo = new Tir[1];

boolean go_tirDeux = false;
TirDeux[] tirletsgoDeux = new TirDeux[1];

Float testPos = 0.0f;
Float testPosDeux = 0.0f;

Float SmoX;
int SmoY;

int score = 0;
int maxScore = 10;
int maxScoreDeux = 10;

int scoreDeux = 0;

float tirX;
float tirY;

float tirXdeux;
float tirYdeux;

float logoX;
float logoY;


Float PlX;
int PlY;

float Xtir;
float Ytir;

float XtirDeux;
float YtirDeux;

float FuseX;
float FuseY;

float FuseXDeux;
float FuseYDeux;

boolean hautDeux = false;
boolean basDeux = false;
boolean droiteDeux = false;
boolean gaucheDeux = false;

boolean haut = false;
boolean bas = false;
boolean droite = false;
boolean gauche = false;

int time;
int start;
int maxTime = 5000;

int replayX = 500;
int replayY = 580;


Minim minim;
AudioPlayer song;
AudioPlayer Piou;
AudioPlayer Boum;
AudioPlayer Oui;
AudioPlayer Fin;
AudioPlayer Espace;

int savedTime;
int totalTime = 12000;
boolean ready = false;

int logoAlea = (int)random(0,2);
int logoTime;
int TimerLogo;


public void setup() {
  
  logoTime = millis();

  savedTime = millis();

  start = millis();
  time = 0 ;
  minim = new Minim(this);
  song = minim.loadFile("640392main_STS-26_Liftoff.mp3");
  Piou = minim.loadFile("pioud.wav");
  Boum = minim.loadFile("boum.wav");
  Oui = minim.loadFile("oui.wav");
  Fin = minim.loadFile("fin.wav");
  Espace = minim.loadFile("espace.wav");


  // Taille
  

  // Pas de contours
  noStroke();

  //Parametres
  
  frameRate(60);

  // Couleur de fond
  background(29, 29, 27);

  textAlign(CENTER);

  // Mode centre
  shapeMode(CENTER);

  //Initialisation
  c1 = new cercle();
  c2 = new Fusee();
  c5 = new FuseeDeux();
  c6 = new Logo();
  //c4 = new Planet("Lune.svg", random(50, 450), -150, 1);

  // Boucle creation etoiles
  for (int i = 0; i< tab_star.length; i++) {
    tab_star[i] = new Star(5, random(0, width), random(0, height), color(150), 255);
  }

  //Boucle creation des planètes
  for (int i = 0; i< lalunetombe.length; i++) {
    lalunetombe[i] = new Planet("Lune.svg", random(50, 450), random(0, -500), 1);
  }

  //lalunetombe[1] = new Planet("Espace.svg",50,0,24);


  for (int i = 0; i< smokesmoke.length; i++) {
    smokesmoke[i] = new Smoke("Espace.svg", random(0, width), random(0, height), 1);
  } 

  for (int i = 0; i< tirletsgo.length; i++) {
    tirletsgo[i] = new Tir("tir.svg", 0, testPos, 5);
    testPos = Ytir - 1;
  }

  for (int i = 0; i< tirletsgoDeux.length; i++) {
    tirletsgoDeux[i] = new TirDeux("tir.svg", 0, testPosDeux, 5);
    testPosDeux = YtirDeux - 1;
  }
}



public void draw() {

  // Calculate how much time has passed
  int passedTime = millis() - savedTime;

  song.play();

  if (Espace.isPlaying()==false) {
    Espace.rewind();
    Espace.play();
  }
  if (end != true) {
    fill(255);
    textSize(35); 
    text("Vs I.A.", 500, 450);
    text("Flèches directionnelles pour se déplacer.", 500, 500);
    text("Vous contrôlez la fusée rouge.", 500, 550);
  }

  // Has five seconds passed?
  if (passedTime > totalTime) {
    
    
    TimerLogo = millis()-logoTime;
    println(TimerLogo);

    time = millis()-start;

    background(29, 29, 27);

    rectMode(CENTER);

    // Pas de curseur
    noCursor();

    // Creation des halos
    c1.dessinerCercle();  

    // Boucle pour animer les etoiles et les dessiner
    for (int i = 0; i< tab_star.length; i++) {
      tab_star[i].Move();
      tab_star[i].Draw();
    }

    //fill(223, 12, 27);
    //rect(500,500,10,1000);

    if (go_planet==true) {

      for (int m = 0; m < lalunetombe.length; m++) {
        lalunetombe[m].animPlanet();
        lalunetombe[m].dessinerPlanet();
      }
    }

    if (score == maxScore) {

      //println("xccgjvdifhgidvfbgvkjdbfhjk");
      lalunetombe = (Planet[]) append(lalunetombe, new Planet("Lune.svg", random(0, width), random(-50, -500), 1));

      Oui.play();

      maxScore += 10;

      Oui.rewind();
    }
    
    if (scoreDeux == maxScoreDeux) {

      //println("xccgjvdifhgidvfbgvkjdbfhjk");
      lalunetombe = (Planet[]) append(lalunetombe, new Planet("Lune.svg", random(0, width), random(-50, -500), 1));

      Oui.play();

      maxScoreDeux += 10;

      Oui.rewind();
    }

    //for (int i = 0; i < lalunetombe.length; i++ ) { 
    //  lalunetombe[i].animPlanet();
    //    lalunetombe[i].dessinerPlanet();
    //}




    if (go_fume==true) {

      for (int m = 0; m < smokesmoke.length; m++) {

        smokesmoke[m].animElipse();
        smokesmoke[m].dessinerElipse();
      }
    }

    for (int m = 0; m < tirletsgo.length; m++) {

      tirletsgo[m].animTir();
      tirletsgo[m].dessinerTir();
    }

    for (int m = 0; m < tirletsgoDeux.length; m++) {

      tirletsgoDeux[m].animTirDeux();
      tirletsgoDeux[m].dessinerTirDeux();
    }

    // Affichage de la fusee
    c2.dessinerFusee();

    c5.dessinerFuseeDeux();
    
    c6.dessinerLogo();
    c6.animerLogo();

    if (time >= maxTime) {
      go_planet = true ;
      //go_fume =true;
      start = millis();
      time = 0;
    }

    fill(255);
    textSize(35); 
    text(score, 50, 50);
    fill(223, 12, 27);
    text(scoreDeux, 950, 50);
  }
}


public void mousePressed() {
  if (mouseX >= (replayX-100) && mouseX <= (replayX+100) && mouseY >= (replayY-25) && mouseY <= (replayY+25)) {
    end = false;
    score = 0;
    scoreDeux = 0;
    maxScore = 10;
    maxScoreDeux = 10;
    //lalunetombe = (Planet[]) append(lalunetombe,new Planet("Lune.svg", random(0, width), random(0, -500), 1));
    lalunetombe = new Planet[1];
    setup();
    draw();
  }
}

public void keyPressed() {
  switch(key) {
  case 'z':
    hautDeux = true;
    break;
  case 's':
    basDeux = true;
    break;
  case 'q':
    gaucheDeux = true;
    break;
  case 'd':
    droiteDeux = true;
    break;
  }

  switch(keyCode) {
  case UP:
    haut = true;
    break;
  case DOWN:
    bas = true;
    break;
  case LEFT:
    gauche = true;
    break;
  case RIGHT:
    droite = true;
    break;
  }
}

public void keyReleased() {
  switch(key) {
  case 'z':
    hautDeux = false;
    break;
  case 's':
    basDeux = false;
    break;
  case 'q':
    gaucheDeux = false;
    break;
  case 'd':
    droiteDeux = false;
    break;
  }

  switch(keyCode) {
  case UP:
    haut = false;
    break;
  case DOWN:
    bas = false;
    break;
  case LEFT:
    gauche = false;
    break;
  case RIGHT:
    droite = false;
    break;
  }
}

public void stop() {
  Piou.close();
  Boum.close();
  Oui.close();
  minim.stop();
  super.stop();
}
class Etoiles {

  float r;
  int c;
  float o;
  float spring = 0;
  float gravity = 0;
  float friction = -0.1f;

  boolean active = false;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  int id;
  Etoiles(float m, float tr, float tx, float ty, int tc, float to) {
    r = tr;
    c = tc;
    o = to;


    mass = m;
    location = new PVector(tx, ty);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  Etoiles(float m, float tr, float tx, float ty, int tc, float to, int idin) {

    r = tr;
    c = tc;
    o = to;
    id = idin;


    mass = m;
    location = new PVector(tx, ty);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  public void setPos(float tx, float ty) {
    location.x = tx;
    location.y = ty;
  }

  // Newton’s second law.
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  public void Draw() {
    fill(c, o);
    ellipse(location.x, location.y, r, r);
  }


  public void collide() {
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  public void Move() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= 0;
    } else if (location.x < 0) {
      velocity.x *= 0;
      location.x = 0;
      collide();
    }

    if (location.y > height) {
      velocity.y *= 0;
      location.y = height;
      collide();
    }
  }



  public void Slide() {

    if (location.y > height) {
      location.y = location.y -10;
    }
  }
}
class Fusee {

  PShape fuse = loadShape("Fusee.svg");
  PShape corps = fuse.getChild("Corps");
  PShape eting;
  PShape etinc; 
  PShape etind;

  float taille;



  int random;
  int randomd;
  int randomc;

  //Méthodes
  Fusee() {
    FuseX = 750;
    FuseY = 900;
    tirX = FuseX;
    tirY = FuseY;
    fuse.disableStyle();
    taille = 0.5f;

    eting = fuse.getChild("Etincelle_G");
    etinc = fuse.getChild("Etincelle_M");
    etind = fuse.getChild("Etincelle_D");
  }

  public void dessinerFusee() {    

    random = (int)random(4);
    randomd = (int)random(4);
    randomc = (int)random(4);

    // Affiche un tir et le fait se deplacer en y
    //shape(tir, tirX, tirY, tir.getWidth(), tir.getHeight());
    //tirY = tirY - 15;

    // Affichage fusee
    fill(223, 12, 27);
    shape(corps, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());

    if (random == 1) {
      shape(eting, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());
    } else {
      random = (int)random(3);
    }
    if (randomc == 2) {
      shape(etinc, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());
    } else {
      randomc = (int)random(3);
    }
    if (randomd == 3) {
      shape(etind, FuseX, FuseY, taille*fuse.getWidth(), taille*fuse.getHeight());
    } else {
      randomd = (int)random(3);
    }


    // Controls
    if (end != true) {
      if (haut == true && FuseY > 500) {
        FuseY -= 7;
      }

      if (bas == true && FuseY < 950) {
        FuseY += 7;
      }

      if (gauche == true && FuseX > 50) {
        FuseX -= 7;
      }

      if (droite == true && FuseX < 950) {
        FuseX += 7;
      }
    }
  }
}
class FuseeDeux {

  PShape fuseDeux = loadShape("Fusee.svg");
  PShape corpsDeux = fuseDeux.getChild("Corps");
  PShape etingDeux;
  PShape etincDeux; 
  PShape etindDeux;

  float taille;


  int randomDeux;
  int randomdDeux;
  int randomcDeux;

  //Méthodes
  FuseeDeux() {
    FuseXDeux = 250;
    FuseYDeux = 900;
    tirX = FuseXDeux;
    tirY = FuseYDeux;
    fuseDeux.disableStyle();
    taille = 0.5f;

    etingDeux = fuseDeux.getChild("Etincelle_G");
    etincDeux = fuseDeux.getChild("Etincelle_M");
    etindDeux = fuseDeux.getChild("Etincelle_D");
  }

  public void dessinerFuseeDeux() {    

    randomDeux = (int)random(4);
    randomdDeux = (int)random(4);
    randomcDeux = (int)random(4);

    // Affiche un tir et le fait se deplacer en y
    //shape(tir, tirX, tirY, tir.getWidth(), tir.getHeight());
    //tirY = tirY - 15;

    // Affichage fusee
    fill(255);
    shape(corpsDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());

    if (randomDeux == 1) {
      shape(etingDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());
    } else {
      randomDeux = (int)random(3);
    }
    if (randomcDeux == 2) {
      shape(etincDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());
    } else {
      randomcDeux = (int)random(3);
    }
    if (randomdDeux == 3) {
      shape(etindDeux, FuseXDeux, FuseYDeux, taille*fuseDeux.getWidth(), taille*fuseDeux.getHeight());
    } else {
      randomdDeux = (int)random(3);
    }
  }
}
class Logo {

  PShape logogo = loadShape("imm.svg");
  float tailleLogo;
  
  boolean goRight = false;
  boolean goLeft = false;
  
  int randomLogo;

  Logo() {
    //logogo.disableStyle();
    //logoX = -500;
    //logoY = 500;
    logoY = random(550,700);
    tailleLogo = 0.3f;
    if (logoAlea == 0){
      logoX = -100;
      goRight = true;
    } else{
      logoX = 1100;
      goLeft = true;
    }
    randomLogo = (int)random(30000,50000);
  }

  public void dessinerLogo() {
    //fill(223, 12, 27);
      shape(logogo, logoX, logoY, tailleLogo*logogo.getWidth(), tailleLogo*logogo.getHeight());
  }
  
  public void animerLogo() {
    
    if (randomLogo <= TimerLogo){
    if (goRight == true){
      logoX = logoX + 5;
    }
    if (goLeft == true){
      logoX = logoX - 5;
    }
    //logoX = (logoX + 2)+random(-5,5);
    logoY = (logoY +random(-10,10));
    }
  }
}
class Planet {

  float Xplanet;
  float Yplanet;
  PShape imaPla;
  float Zplanet;

  int RdmVi;

  Planet(String fichier_planet, float PlX, float PlY, float PlZ) {
    imaPla = loadShape(fichier_planet);
    Xplanet = PlX;
    Yplanet = PlY;
    Zplanet =  PlZ;
    RdmVi = (int)random(5, 10);
  }

  public void dessinerPlanet() {
    shape(imaPla, Xplanet, Yplanet, 100, 100);
  }

  public void animPlanet() {

    if ( Yplanet < height) {
      Yplanet = Yplanet + RdmVi;
    } else
    {     
      Xplanet = random(50, 950);
      Yplanet = 0;
    }


    if (Ytir <= (Yplanet)+50 && Ytir >= (Yplanet)-50 && Xtir <= (Xplanet)+50 && Xtir >= (Xplanet)-50) {
      Xplanet = random(50, 950);
      Yplanet = -200;
      Xtir = 5000;
      scoreDeux++;
      Boum.play();
      Boum.rewind();
    }

    if (YtirDeux <= (Yplanet)+50 && YtirDeux >= (Yplanet)-50 && XtirDeux <= (Xplanet)+50 && XtirDeux >= (Xplanet)-50) {
      Xplanet = random(50, 950);
      Yplanet = -200;
      XtirDeux = 5000;
      score++;
      Boum.play();
      Boum.rewind();
    }

    /*if (logoX > 50 || logoX < 950){
     if (logoX < 500 && FuseXDeux > logoX){
     FuseXDeux -= 7;
     }
     if (logoX > 500 && FuseXDeux < logoX){
     FuseXDeux += 7;
     }
     } else if ( Xplanet >= 500 && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50)){
     if (FuseXDeux < 950) {
     FuseXDeux += 7;
     if (FuseXDeux >= Xplanet){
     FuseXDeux -= 7;
     }
     }
     } else if ( Xplanet <= 500 && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50)){
     if (FuseXDeux > 50) {
     FuseXDeux -= 7;
     if (FuseXDeux <= Xplanet){
     FuseXDeux += 7;
     }
     }
     }*/

    if (Yplanet >= 50){
     
     if ( Xplanet >= FuseXDeux){
     if (FuseXDeux < 950) {
     FuseXDeux = FuseXDeux + 5;
     }
     }
     
     if ( Xplanet <= FuseXDeux){
     if (FuseXDeux > 50) {
     FuseXDeux = FuseXDeux - 5;
     }
     }
     
     if (Yplanet >= (FuseYDeux-150)){
     if (Xplanet >= (FuseXDeux+50)){
     FuseXDeux = FuseXDeux - 5;
     } else if (Xplanet <= (FuseXDeux-50)){
     FuseXDeux = FuseXDeux + 5;
     }
     }
     
     if (Yplanet == FuseYDeux){
     if (Xplanet >= (FuseXDeux+50)){
     FuseXDeux = FuseXDeux - 5;
     } else if (Xplanet <= (FuseXDeux-50)){
     FuseXDeux = FuseXDeux + 5;
     }
     }
     }

    /*
    TESTTSDJGFSQJFGJSDHGFYJHSJHF
    
    if (Yplanet >= (FuseYDeux-100)) {
      if (Xplanet <= (FuseXDeux-10) && FuseXDeux > 50) {
        FuseXDeux += 5;
      } else if (Xplanet >= (FuseXDeux+10) && FuseXDeux < 950) {
        FuseXDeux -= 5;
      }
      
      if(Xplanet <= FuseXDeux){
        if (FuseXDeux > 50) {
     FuseXDeux = FuseXDeux - 5;
     }
      } else if (Xplanet >= FuseXDeux) {
        if (FuseXDeux < 950) {
     FuseXDeux = FuseXDeux + 5;
     }
      }
    }*/


    /*if ( Yplanet <= FuseYDeux && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50 && FuseY >=(Yplanet)+50 && FuseY <=(Yplanet)-50)){
     if (FuseYDeux < 950) {
     FuseYDeux = FuseYDeux + 7;
     }
     }
     
     if ( Yplanet >= FuseYDeux && !(FuseX >= (Xplanet)+50 && FuseX <= (Xplanet)-50 && FuseY >=(Yplanet)+50 && FuseY <=(Yplanet)-50)){
     if (FuseYDeux > 500) {
     FuseYDeux = FuseYDeux - 7;
     }
     }*/

    if (FuseY <= (logoY)+50 && FuseY >= (logoY)-50 && FuseX <= (logoX)+50 && FuseX >= (logoX)-50) {
      //fill(255);
      textSize(30); 
      text("+5", (FuseX+5), (FuseY+15));
      logoX = 5000;
      XtirDeux = 5000;
      scoreDeux += 5;
      Boum.play();
      Boum.rewind();
    }

    if (FuseYDeux <= (logoY)+50 && FuseYDeux >= (logoY)-50 && FuseXDeux <= (logoX)+50 && FuseXDeux >= (logoX)-50) {
      textSize(30); 
      //fill(223, 12, 27);
      text("+5", (FuseXDeux+5), (FuseYDeux+15));
      logoX = 5000;
      Xtir = 5000;
      score += 5;
      Boum.play();
      Boum.rewind();
    }

    if (FuseY <= (Yplanet)+50 && FuseY >= (Yplanet)-50 && FuseX <= (Xplanet)+50 && FuseX >= (Xplanet)-50) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(255);
        textSize(35); 
        text("Score : "+score, 500, 450);
        text("La fusée blanche a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }

    if (score == 100) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(255);
        textSize(35); 
        text("Score : "+score, 500, 450);
        text("La fusée blanche a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }

    if (scoreDeux == 100) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(223, 12, 27);
        textSize(35); 
        text("Score : "+scoreDeux, 500, 450);
        text("La fusée rouge a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }

    if (FuseYDeux <= (Yplanet)+50 && FuseYDeux >= (Yplanet)-50 && FuseXDeux <= (Xplanet)+50 && FuseXDeux >= (Xplanet)-50) {
      end = true;
      if (end == true) {
        savedTime = millis();
        cursor();
        Fin.play();
        fill(29, 29, 27);
        rect(500, 500, width, height);
        fill(223, 12, 27);
        textSize(35); 
        text("Score : "+scoreDeux, 500, 450);
        text("La fusée rouge a gagné", 500, 500);
        //textSize(16); 
        //text("(Yes les bugs)", 250, 530);
        rect(replayX, replayY, 200, 50);
        textSize(25); 
        fill(29, 29, 27);
        text("Replay", 500, 590);
        mousePressed();
      }
    }
  }
}
class Smoke {

  float Xsmo;
  float Ysmo;
  PShape imaSmo;
  float Zsmo;


  int couleur;
  int aleColor = (int)random(0, 3);

  PShape ElliSmoke = loadShape("Espace.svg");

  Smoke(String fichier_smoke, float SmoX, float SmoY, float SmoZ) {
    imaSmo = loadShape(fichier_smoke);
    Xsmo = SmoX;
    Ysmo = SmoY;
    Zsmo =  SmoZ;
    Xsmo = FuseX;
  }

  public void dessinerElipse() {

    Ysmo = FuseY;

    imaSmo.disableStyle();
    switch(aleColor) {
    case 0:
      couleur = color(0xff1F1E1B);
      break;
    case 1:
      couleur = color(0xffDF0C1B);
      break;
    case 2:
      couleur = color(255);
      break;
    }

    fill(couleur);
    shape(imaSmo, Xsmo, Ysmo, 50, 50);
  }

  public void animElipse() {

    if ( Ysmo < height) {
      Ysmo = Ysmo + 5;
      //Xsmo = random(0,width);
      //translate(random(0, width), 5);
    } else
    {     
      Ysmo = FuseY;
      Xsmo = FuseX;
    }
  }
}
class Star extends Etoiles {

  Star(float tr, float tx, float ty, int tc, float to) {

    super(0, tr, tx, ty, tc, to);
  }

  public void Move() {
    location.x = location.x + random(-1, 1);
    location.y = location.y + random(-1, 1);

    constrain(location.x, 0, width);
    constrain(location.y, 0, height);
  }
}
class Tir {


  PShape imaTir;
  float Ztir;

  PShape TirBoum = loadShape("tir.svg");

  Tir(String fichier_tir, float tirX, float tirY, float tirZ) {
    imaTir = loadShape(fichier_tir);
    Xtir = tirX;
    Ytir = tirY;
    Ztir =  tirZ;
    Xtir = FuseX;
  }

  public void dessinerTir() {

    //tirY = FuseY;
    shape(imaTir, Xtir, Ytir, imaTir.getWidth(), imaTir.getHeight());
    Ytir = Ytir - 70;
  }

  public void animTir() {

    if ( Ytir <= (FuseY-height)) {
      Ytir = FuseY;
      Xtir = FuseX;
      Piou.rewind();
      //Xsmo = random(0,width);
      //translate(random(0, width), 5);
    } else
    {
      if (song.isPlaying() == false) {
        Piou.play();
      }
    }
  }
}
class TirDeux {


  PShape imaTirDeux;
  float ZtirDeux;

  PShape TirBoumDeux = loadShape("tir.svg");

  TirDeux(String fichier_tirDeux, float tirXdeux, float tirYdeux, float tirZdeux) {
    imaTirDeux = loadShape(fichier_tirDeux);
    XtirDeux = tirXdeux;
    YtirDeux = tirYdeux;
    ZtirDeux =  tirZdeux;
    XtirDeux = FuseXDeux;
    imaTirDeux.disableStyle();
  }

  public void dessinerTirDeux() {

    //tirY = FuseY;
    fill(255);
    shape(imaTirDeux, XtirDeux, YtirDeux, imaTirDeux.getWidth(), imaTirDeux.getHeight());
    YtirDeux = YtirDeux - 70;
  }

  public void animTirDeux() {

    if ( YtirDeux <= (FuseYDeux-height)) {
      YtirDeux = FuseYDeux;
      XtirDeux = FuseXDeux;
      Piou.rewind();
      //Xsmo = random(0,width);
      //translate(random(0, width), 5);
    } else
    {
      if (song.isPlaying() == false) {
        Piou.play();
      }
    }
  }
}
class cercle {

  //Atributs
  PShape image = loadShape("Espace.svg");
  PShape halo1;
  PShape halo2;
  PShape halo3;

  //Méthodes
  cercle() {

    halo1 = image;
    halo2 = image;
    halo3 = image;

    image.disableStyle();
  }

  public void dessinerCercle() {

    // Dessine 3 halos

    fill(color(0xff595B65), 150);
    shape(halo1, 500, 1000, 510, 510);

    fill(color(0xff595B65), 100);
    shape(halo2, 500, 1000, 1000, 1000);

    fill(color(0xff595B65), 50);
    shape(halo3, 500, 1000, 1500, 1500);
  }
}
  public void settings() {  size(1000, 1000);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "ia" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

Fusee c2;
Fusee c5;
cercle c1;
Etoiles c3;
Logo c6;

import gazetrack.*;

GazeTrack gazeTrack;

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

Float testPos = 0.0;
Float testPosDeux = 0.0;

Float SmoX;
int SmoY;

int score = 0;
int maxScore = 10;
int maxScoreDeux = 10;

int scoreDeux = 0;

int postirX=25;
int postirY=25;

float tirX;
float tirY;

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

int replayX = width/2;
int replayY = (height/2)+50;

import ddf.minim.*;
Minim minim;
AudioPlayer Background;
AudioPlayer TirOne;
AudioPlayer TirTwo;
AudioPlayer PlanetDestroy;
AudioPlayer ColiFusee;
AudioPlayer DestroyFusee;
AudioPlayer Bonus;
AudioPlayer Win;

int savedTime;
int totalTime = 5000;
boolean ready = false;

int logoAlea = (int)random(0,2);
int logoTime;
int TimerLogo;


void setup() {
    
  gazeTrack = new GazeTrack(this);
  logoTime = millis();

  savedTime = millis();

  start = millis();
  time = 0 ;
  minim = new Minim(this);
  TirOne = minim.loadFile("tir_1.mp3");
  TirTwo = minim.loadFile("tir_2.mp3");
  Background = minim.loadFile("soundMaximeTwo.mp3");
  PlanetDestroy = minim.loadFile("tir-planete.mp3");
  ColiFusee = minim.loadFile("collisions_fusee.mp3");
  DestroyFusee = minim.loadFile("crash-fusee.mp3");
  Bonus = minim.loadFile("bonus.mp3");
  Win = minim.loadFile("win.mp3");

  // Taille
  fullScreen();

  // Pas de contours
  noStroke();

  //Parametres
  smooth();
  frameRate(60);

  // Couleur de fond
  background(29, 29, 27);

  textAlign(CENTER);

  // Mode centre
  shapeMode(CENTER);

  //Initialisation
  c1 = new cercle();
  c2 = new Fusee();
  c5 = new Fusee();
  c6 = new Logo();
  //c4 = new Planet("Lune.svg", random(50, 450), -150, 1);

  // Boucle creation etoiles
  for (int i = 0; i< tab_star.length; i++) {
    tab_star[i] = new Star(5, random(0, width), random(0, height), color(150), 255);
  }

  //Boucle creation des planètes
  for (int i = 0; i< lalunetombe.length; i++) {
    lalunetombe[i] = new Planet("Lune.svg", random(50, (width-50)), random(0, -500), 1);
  }

  //lalunetombe[1] = new Planet("Espace.svg",50,0,24);


  for (int i = 0; i< smokesmoke.length; i++) {
    smokesmoke[i] = new Smoke("Espace.svg", random(0, width), random(0, height), 1);
  } 

  for (int i = 0; i< tirletsgo.length; i++) {
    tirletsgo[i] = new Tir("tir.svg");
    tirletsgo[i].Xtir=c2.FuseX;
    tirletsgo[i].Ytir=c2.FuseY;
    tirletsgo[i].dessinerTir();
  }

  for (int i = 0; i< tirletsgoDeux.length; i++) {
    tirletsgoDeux[i] = new TirDeux("tir.svg", 0, testPosDeux, 5);
    testPosDeux = YtirDeux - 1;
  }
  
  c2.FuseX=0+width/4*1;
  c2.FuseY=height - 100;
  c2.dessinerFusee(c2.FuseX,c2.FuseY);
  
  c5.FuseX=0+width/4*3;
  c5.FuseY=height - 100;
  c5.dessinerFusee(c5.FuseX, c5.FuseY);
  
}



void draw() {

  // Calculate how much time has passed
  int passedTime = millis() - savedTime;

  if (Background.isPlaying()==false) {
    Background.rewind();
    Background.play();
  }
  if (end != true) {
    fill(255);
    textSize(35); 
    text("Vs I.A.", width/2, (height/2)-50);
    text("Flèches directionnelles pour se déplacer.", width/2, height/2);
    text("Vous contrôlez la fusée rouge.", width/2, (height/2)+50);
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
    
    fill(223, 12, 27);
    ellipse(mouseX,mouseY,20,20);

     

    // Boucle pour animer les etoiles et les dessiner
    for (int i = 0; i< tab_star.length; i++) {
      tab_star[i].Move();
      tab_star[i].Draw();
    }

    if (go_planet==true) {

      for (int m = 0; m < lalunetombe.length; m++) {
        lalunetombe[m].animPlanet();
        lalunetombe[m].dessinerPlanet();
      }
    }

    if (score == maxScore) {
      lalunetombe = (Planet[]) append(lalunetombe, new Planet("Lune.svg", random(0, width), random(-50, -500), 1));
      //Oui.play();
      maxScore += 10;
      //Oui.rewind();
    }
    
    if (scoreDeux == maxScoreDeux) {
      lalunetombe = (Planet[]) append(lalunetombe, new Planet("Lune.svg", random(0, width), random(-50, -500), 1));
      //Oui.play();
      maxScoreDeux += 10;
      //Oui.rewind();
    }

    if (go_fume==true) {

      for (int m = 0; m < smokesmoke.length; m++) {

        smokesmoke[m].animElipse();
        smokesmoke[m].dessinerElipse();
      }
    }

    for (int m = 0; m < tirletsgo.length; m++) {
      tirletsgo[m].dessinerTir();
      tirletsgo[m].animTir();
      if(tirletsgo[m].Ytir<0){
        tirletsgo[m].Ytir=c2.FuseY;
        tirletsgo[m].Xtir=c2.FuseX;
      }
    }
    
    for (int m = 0; m < tirletsgoDeux.length; m++) {
      tirletsgoDeux[m].animTirDeux();
      tirletsgoDeux[m].dessinerTirDeux();
    }

    // Affichage de la fusee
    //c2.FuseX=(int)gazeTrack.getGazeX();
    //c2.FuseY=(int)gazeTrack.getGazeY();
    fill(223, 12, 27);
    c2.dessinerFusee(c2.FuseX,c2.FuseY);
    c2.animFusee();
    
    fill(255);
    c5.dessinerFusee(c5.FuseX, c5.FuseY);
    
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
    text(scoreDeux, width-50, 50);
  }
}


void mousePressed() {
  if (mouseX >= (replayX-100) && mouseX <= (replayX+100) && mouseY >= (replayY-25) && mouseY <= (replayY+25)) {
    end = false;
    score = 0;
    scoreDeux = 0;
    maxScore = 10;
    maxScoreDeux = 10;
    
    lalunetombe = new Planet[1];
    setup();
    draw();
  }
}

void stop() {
  Background.close();
  TirOne.close();
  TirTwo.close();
  minim.stop();
  super.stop();
}

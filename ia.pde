Fusee c2;
Fusee c5;
cercle c1;
Etoiles c3;
Logo c6;
//Planet c4;

/*ArrayList tirboum = new ArrayList();*/

boolean end = false;
//hello
//cc BIMBAMBOUM

//boolean fuseDeuxDepla = false;
//boolean fuseDepla = false;
int deplaFuse = 0;
int deplaFuseDeux = 0;




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

int replayX = width/2;
int replayY = (height/2)+50;

import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioPlayer Piou;
AudioPlayer Boum;
AudioPlayer Oui;
AudioPlayer Fin;
AudioPlayer Espace;
AudioPlayer aah;
AudioPlayer ooh;

int savedTime;
int totalTime = /*12000*/ 5000;
boolean ready = false;

int logoAlea = (int)random(0,2);
int logoTime;
int TimerLogo;


void setup() {
  
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
  aah = minim.loadFile("ooh.wav");
  ooh = minim.loadFile("aah.wav");


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


  c2.FuseX=0+width/4*1;
  c2.FuseY=height - 100;
  c2.dessinerFusee(c2.FuseX,c2.FuseY);
  c5.dessinerFusee(0+width/4*3,height - 100);
  
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
    tirletsgoDeux[i] = new TirDeux("tir.svg", c2.FuseX, c2.FuseY,5);
    testPosDeux = YtirDeux - 1;
  }

  
}



void draw() {

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
    };
    for (int m = 0; m < tirletsgoDeux.length; m++) {
      tirletsgoDeux[m].animTirDeux();
      tirletsgoDeux[m].dessinerTirDeux();
    }

    // Affichage de la fusee
    c2.dessinerFusee(c2.FuseX,c2.FuseY);
    c5.dessinerFusee(0+width/4*3,height - 100);
    
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
    //lalunetombe = (Planet[]) append(lalunetombe,new Planet("Lune.svg", random(0, width), random(0, -500), 1));
    lalunetombe = new Planet[1];
    setup();
    draw();
  }
}

void mouseMoved(){
  if (mouseX > c2.FuseX && c2.FuseX < width-50){
      c2.FuseX += 10;
    }
    if (mouseX < c2.FuseX && c2.FuseX > 50){
      c2.FuseX -= 10;
    }
    if (mouseY > c2.FuseY && c2.FuseY < height-50){
      c2.FuseY += 10;
    }
    if (mouseY < c2.FuseY && c2.FuseY > 500){
      c2.FuseY -= 10;
    }
}

void stop() {
  Piou.close();
  Boum.close();
  Oui.close();
  minim.stop();
  super.stop();
}
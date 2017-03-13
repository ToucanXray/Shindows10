PImage wallpaper1;
PImage wallpaper2;
PImage wallpaper3;
PImage wallpaper4;
PImage wallpaper5;
PImage settings;
PFont mono;
PFont defaultFont;
PFont defaultFontBold;
PFont defaultFontThin;
String desktopImage;
boolean Start = false;
boolean Loading = false;
int w = 800; //Ширина
int h = 600; //Высота
int wallpaper = 1;
boolean settingsClicked = false;
boolean settingsClosed = true;
boolean menuClicked = false;
boolean menuOpened = false;
boolean menuClosed = false;
boolean desktop = true;

// Таймеры

int PreloadingTimer = 0;
int LoadingTimer = 0;
int Timer = 255;
int ClockTimer = 0;
int BSET = 0;

// Синий экран смерти

float BSEr;
int BSE;

void settings() {
  fullScreen();
  size(w,h);
}

void setup() {
  background(0,0,0);
  settings = loadImage("settings.JPG");
  wallpaper1 = loadImage("wallpaper1.jpg");
  wallpaper2 = loadImage("wallpaper2.jpg");
  wallpaper3 = loadImage("wallpaper3.jpg");
  wallpaper4 = loadImage("wallpaper4.jpg");
  wallpaper5 = loadImage("wallpaper5.jpg");
  mono = createFont("mono.TTF",15);
  defaultFont = createFont("defaultMedium.otf",15);
  defaultFontBold = createFont("defaultBold.otf",20);
  defaultFontThin = createFont("defaultThin.otf",15);
  noStroke();
  BSEr=random(10);
  BSE=round(BSEr);
}

void preloading() {
  fill(0,0,0);
  rect(0,0,w,h);
  fill(255,255,255);
  textFont(defaultFont);
  text("DUDETSBIOS (C) 2017 Daunkrosoft Russia, Inc.",20,20);
  text("DudetsBIOS v. 1.0",20,40);
  PreloadingTimer++;
  if (PreloadingTimer == 100) {
    Loading=true;
    clear();
  }
}

void loading() {
  if (Loading == true) {
    fill(0,0,0);
    rect(0,0,800,600);
    fill(255,255,255);
    textAlign(CENTER);
    textFont(defaultFont);
    textSize(80);
    text("Shindows 10",width/2,height/2);
    LoadingTimer++;
    fill(255,255,255);
    rect(width*0.42,height*0.583,LoadingTimer,30);
    if (LoadingTimer == 300) {
      delay(1000);
      Start = true;
      LoadingTimer=0;
      }
  }
  else {
    preloading();
  }
}

void draw() {

  if (Start == true) {
    
    if(wallpaper==1) {
      background(wallpaper1); 
    }
    
    if(wallpaper==2) {
      background(wallpaper2); 
    }
    
    if(wallpaper==3) {
      background(wallpaper3); 
    }
    
    if(wallpaper==4) {
      background(wallpaper4); 
    }
    
    if(wallpaper==5) {
      background(wallpaper5); 
    }
    
    // Файндер
    
    fill(115,115,115,255);
    rect(0,0,width,21);    
    
      /// Заголовок программы
      
      fill(255,255,255);
      textSize(15);
      textAlign(LEFT);
      textFont(defaultFont);
      text("Explorer",10,16);
    
      /// Часы
      
      int hours = hour();
      int minutes = minute();
      fill(255,255,255);
      textSize(15);
      textAlign(RIGHT);
      textFont(defaultFont);
      if(minutes < 10) { text(hours+":0"+minutes,width-10,17); }
      else {text(hours+":"+minutes,width-10,17); }
    
    // Док
    
    fill(255,255,255,70);
    rect(50,height-75,width-100,75,5,5,0,0);
    
    // Версия программы
    
    fill(255,255,255,200);
    textSize(15);
    textAlign(RIGHT);
    textFont(defaultFont);
    text("Shindows 10 build 10006",width-10,40);
    
    if((settingsClicked)&(settingsClosed)) {
      programSettings();
    }
    
    if((menuClicked)&(menuClosed == false)) {
      menu();
    }
    
    fill(255,255,255);
    rect(70,1015,50,50);
    
    // Экран "Welcome Back"
    
    Timer--;
    fill(255,255,255,Timer-50);
    textAlign(CENTER);
    textFont(defaultFontBold);
    textSize(40);
    text("Welcome back, Petushina!",width/2,height/2);
    fill(0,0,0,Timer-50);
    rect(0,0,width,height);
    
    // Проверка на ОСЭ
    
    if (BSE == 7) {
      bluescreen();
    }
  }
  
  else {
    loading();
  }
} 

void menu() {
  desktop=false;
  fill(150);
  rect(0,21,200,200);
  stroke(50,50,50);
  line(0,200,199,200);
  noStroke();
  fill(255);
  textFont(defaultFont);
  textSize(15);
  textAlign(LEFT);
  text("Exit",10,217);
  menuOpened=true;
}

void mouseClicked() {
  if((mouseX >= 20) & (mouseX <= 70) & (mouseY >= 40) & (mouseY <= 90) & (desktop)) {
    wallpaper=wallpaper+1;
    if(wallpaper==6) {wallpaper=1;}
    redraw();
  }
  if((mouseX >= 70) & (mouseX <= 120) & (mouseY >= 1015) & (mouseY <= 1065)) {
    settingsClicked=true;
  }
  if((mouseX <= width-20) & (mouseX >= width-31) & (mouseY >= 32) & (mouseY <= 43)) {
    settingsClicked=false;
    settingsClosed=true;
    redraw();
    desktop=true;
  }
  if((mouseX >= 70) & (mouseX <= 120) & (mouseY >= 1015) & (mouseY <= 1065) & (desktop == false)) {
    settingsClicked=false;
    settingsClosed=true;
    redraw();
    desktop=true;
  }
  if((mouseX >= 0) & (mouseX <=100) & (mouseY >=0) & (mouseY <=20)) {
    menuClicked=true;
  }
  if((mouseX >= 0) & (mouseX <=100) & (mouseY >=0) & (mouseY <=20) & (menuOpened)) {
    menuClosed=true;
    menuClicked=false;
    menuOpened=false;
    redraw();
    menuClosed=false;
  }
  if((menuOpened) & (mouseX >= 0) & (mouseX <=200) & (mouseY >=200) & (mouseY <=220)) {
    exit();
  }
}

void keyPressed() {
  Loading=true;
  Start=true;
}

void programSettings() {
  desktop = false;
  int hours = hour();
  int minutes = minute();
  fill(227);
  rect(5,26,width-10,height-106);
  fill(115);
  rect(0,0,width,21);
  
    /// Заголовок программы
    
    fill(255);
    textSize(15);
    textAlign(LEFT);
    textFont(defaultFont);
    text("Settings",10,16);

    /// Часы
   
    fill(255);
    textSize(15);
    textAlign(RIGHT);
    textFont(defaultFont);
    if(minutes < 10) { text(hours+":0"+minutes,width-10,17); }
    else { text(hours+":"+minutes,width-10,17); }

    /// Активная панель
    
    fill(#3eb489);
    rect(5,26,width-10,22);
    fill(#d6290b);
    ellipse(width-26,38,12,12); 
  
  fill(0);
  textFont(defaultFontThin);
  textSize(60);
  textAlign(LEFT);
  text("Settings",20,100);
  
  
  
}

void bluescreen() {
  fill(#0C12A5);
  rect(0,0,width,height);
  fill(255,255,255);
  textSize(15);
  textFont(mono);
  textAlign(LEFT);
  text("A ploblem has been detected and Shindows has been shut down to prevent damage \n to your computer",20,40);
  text("The problem seems to be caused by the following file: tilalka.sys",20,90);
  text("SYSTEM_THREAD_EXCEPTION_NOT_HANDLED",20,120);
  text("If this is the first time you've seen this stop error screen, restart your computer. \n If this screen appears again, follow these steps:",20,150);
  text("Check to make sure any new hardware or software is properly installed. If this is a \n new installation, ask your hardware or software manufacturer \n for any Windows updates you might need.",20,200);
  text("Technical Information:",20,300);
  text("*** STOP: 1x1000001a",20,330);
  text("*** tilalka.sys - Address 0xfffff80002e55151 base at 0xfffff80002e0d000 DateStamp \n 0x4ce7951a",20,350);
  BSET++;
  if (BSET == 300) {
    LoadingTimer=0;
    Timer=255;
    PreloadingTimer=0;
    BSE=0;
    Start=false;
    Loading=false;
    clear();
    preloading();
  }
}
class Estrella{
  // propiedades
  float x, y, tam;
  float vel;
  
  // constructor
  Estrella(){
    background(0);
    x = random(width);
    y = random(height/2);
    tam = random (1, 3);
    vel = .1;
  }
  
  // métodos
  void dibujar(){
    fill(255);
    ellipse(x, y, tam, tam);
  }
  
  void mover(){
    x+=vel;  
    if (x > width+tam) {
      x = -tam;
    } 
  }
}

class Nube{
  // propiedades
  int cant = 6;
  PImage [] nube = new PImage [cant];
  float [] nubeX = new float [cant];
  float [] nubeY = new float [cant];
  float vel;
  
  // constructor
  Nube(){
    imageMode(CENTER);
    for (int i=0; i < cant; i++){
      nube[i] = loadImage("nube.png");
      nubeX[i] = random(width);
      nubeY[i] = random(height/2);
    }
    vel = .1;
  }
  
  // métodos
  void dibujar(){
    background(77, 214, 212);
    for (int i=0; i < cant; i++){
      image(nube[i], nubeX[i], nubeY[i]);
    }  
  }
  
  void mover(){
    for (int i=0; i < cant; i++){
      nubeX[i]+=vel;  
      if (nubeX[i] > width+70) {
        nubeX[i] = -70;
      } 
    }
  }
}

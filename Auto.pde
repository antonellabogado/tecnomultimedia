class Auto{
  // propiedades
  int cant = 3;
  PImage [] auto = new PImage [cant];
  float [] autoX = new float [cant];
  float [] autoY = new float [cant];
  float vel;
  
  // constructor
  Auto(){
    imageMode(CENTER);
    for (int i=0; i < cant; i++){
      auto[i] = loadImage("auto" + i + ".png");
      autoX[i] = -random(100, width);
      autoY[i] = random(400, 590);
    }
    vel = 3;
  }
  
  // métodos
  void dibujar(){
    // calle
    fill(45);
    rect(0, 400, width, 200);
    fill(255);
    rect(0, 490, width, 5);
    
    // autos
    for (int i=0; i < cant; i++){
      image(auto[i], autoX[i], autoY[i]);
    }  
  }
  
  void mover(){
    for (int i=0; i < cant; i++){
      autoX[i]+=vel;  
      if (autoX[i] > width+100) {
        autoX[i] = -random(100, width);
      } 
    }
  }
}

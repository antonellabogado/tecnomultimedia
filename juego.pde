class Juego {
  int cant = 10;
  String nombre;
  
  Gato gato;
  Objeto [] agua = new Objeto[cant];
  Objeto [] lana = new Objeto[cant];
  
  float [] aguaX = new float[cant];
  float [] aguaY = new float[cant];
  float [] lanaX = new float[cant];
  float [] lanaY = new float[cant];
  
  float gatoX = 300;
  float gatoY = 545;
  
  boolean fin;
 
  Juego(boolean fin) {
    this.fin = fin;
    
    gato = new Gato(gatoX, gatoY);
    
    for (int i=0; i<cant; i++) {
      aguaX[i] = random(50, 500);
      aguaY[i] = random(-2050, 0);
      lanaX[i] = random(50, 500);
      lanaY[i] = random(-2000, 0);
      
      agua[i] = new Objeto(aguaX[i], aguaY[i], "agua");
      lana[i] = new Objeto(lanaX[i], lanaY[i], "lana");
    }
  }
  
  void dibujar() {
    if (fin == false) {
      background(247, 181, 95);
       fill(0);
    
       gato.dibujar();
       for (int i=0; i<cant; i++) {
          agua[i].dibujar();
          lana[i].dibujar();
       }
       jugar();
    } 
  }
  
  void jugar() {
    gato.mover();
    for (int i=0; i<cant; i++) {
       agua[i].mover();
       lana[i].mover();
       
       if (lana[i].colisionDosSupCirculares(gato.x, gato.y, 55, lana[i].x, lana[i].y, 50)) {
         lana[i].x = -200;
         lana[i].y = -100;
       } else if (agua[i].colisionDosSupCirculares(gato.x, gato.y, 55, agua[i].x, agua[i].y, 50)) {
         principal.estado = 5;
         fin = true;
       } else if (agua[0].y > height && agua[1].y > height && agua[2].y > height && agua[3].y > height && 
                 agua[4].y > height && agua[5].y> height && agua[6].y  > height && agua[7].y > height && 
                 agua[8].y > height && agua[9].y > height) {
         principal.estado = 4;
         fin = true;
       }
    } 
 }
}

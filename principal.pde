class Principal {
  Juego juego;
  Pantalla pantalla;
  
  int estado = 0;
  
  Principal() {
    juego = new Juego(false);
    pantalla = new Pantalla();
  }
  
  void dibujar() {
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    ellipseMode(CENTER);
    imageMode(CENTER);
    
    if (estado == 0) {
      pantalla.dibujarInicio();
    } else if (estado == 1) {
      pantalla.dibujarInstrucciones();
    } else if (estado == 2) {
      pantalla.dibujarCreditos();
    } else if (estado == 3) {
      juego.dibujar();
    } else if (estado == 4) {
      pantalla.dibujarGanar();
    } else if (estado == 5) {
      pantalla.dibujarPerder();
    }
  }
  
  void cambiarDeEstado() {
    if (estado == 0) {
      if (pantalla.botonJugar.colisionCoorSupRectangular(width/2, height/2 + 25, 130, 50, mouseX, mouseY)) { 
        estado = 3; 
        juego.fin = false;
      } else if (pantalla.botonInstrucciones.colisionCoorSupRectangular((width/2)/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
        estado = 1;
     } else if (pantalla.botonCreditos.colisionCoorSupRectangular((width/2)/2 + width/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
       estado = 2;
     }
    } else if (estado == 1 || estado == 2) {
      if (pantalla.botonAtras.colisionCoordenadaConSupCircular(45, 45, 25, mouseX, mouseY)) {
        estado = 0;
      }
    } else if (estado == 4 || estado == 5) {
      if (pantalla.botonReiniciar.colisionCoorSupRectangular((width/2)/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
        estado = 3;
      //  juego.reiniciar();
        juego.fin = false;
      } else if (pantalla.botonInicio.colisionCoorSupRectangular((width/2)/2 + width/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
        estado = 0;
      }
    }
  }
}

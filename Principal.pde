class Principal {
  Juego juego;
  Pantalla pantalla;

  int estado = 0;

  boolean comenzarReproducido = false;

  Principal() {
    juego = new Juego();
    pantalla = new Pantalla();
  }

  void display() {
    if (estado == 0) {
      pantalla.displayInicio();
      restart();
    } else if (estado == 1) {
      juego.jugar();
      juego.actualizarCuentaRegresiva();
      if (juego.cuentaRegresiva == 0) {
        if (score != 0) {
          ganar.play();
          estado = 3;  // Cambia al estado de fin si la cuenta regresiva llega a cero
        } else {
          perder.play();
          perder.play();
          estado = 4;
        }
      }
    } 
     else if (estado == 5) {
      pantalla.displayTutorial();
    } else if (estado == 2) {
      pantalla.displayCreditos();
    } else if (estado == 3 || estado == 4) pantalla.displayFinalizar(estado);
  } 

  void restart() {
    comenzarReproducido=false;
    score=0;

    juego.gato.setPosition(1000,700);
    juego.gato.setForce(0, 0);
    juego.gato.setVelocity(0, 0);

    juego.marco.setPosition(width * 3/4, height * 2/20);
    juego.marco.setForce(0, 0);
    juego.marco.setVelocity(0, 0);
    juego.marco.setRotation(0);

    juego.marco2.setPosition(width * 1/4, height * 10/20);
    juego.marco2.setForce(0, 0);
    juego.marco2.setVelocity(0, 0);
    juego.marco2.setRotation(0);

    juego.peluche.setPosition( width/2 - 150, height * 6/20);
    juego.peluche.setForce(0, 0);
    juego.peluche.setVelocity(0, 0);
    juego.peluche.setRotation(0);

    juego.pelota.setPosition(width/4, height * 3/20);
    juego.pelota.setForce(0, 0);
    juego.pelota.setVelocity(0, 0);
    juego.pelota.setRotation(0);

    juego.copa.setPosition(width/2 + 150, height * 6/20);
    juego.copa.setForce(0, 0);
    juego.copa.setVelocity(0, 0);
    juego.copa.setRotation(0);

    juego.copa2.setPosition(width/2 - 75, height * 14/20);
    juego.copa2.setForce(0, 0);
    juego.copa2.setVelocity(0, 0);
    juego.copa2.setRotation(0);

    juego.tv.setPosition(width/2 + 300, height * 10/20);
    juego.tv.setForce(0, 0);
    juego.tv.setVelocity(0, 0);
    juego.tv.setRotation(0);
    
    juego.ventilador.setPosition(juego.ventiladorX, juego.ventiladorY);
    juego.ventilador.setForce(0, 0);
    juego.ventilador.setVelocity(0, 0);
    juego.ventilador.setRotation(0);
    
  }

  void cambiarDeEstado() {
    if (estado == 0) { // Si estamos en la pantalla de inicio
      if (punteroX > -740 && punteroX < -500 && punteroY > 470 && punteroY < 530) {
        estado = 1; // Cambiar al estado de juego
        juego.iniciarCuentaRegresiva();
        if (comenzarReproducido == false) {
          comenzar.play();
          comenzarReproducido = true;
        }
      } else if (punteroX > -700 && punteroX < -500  && punteroY > 550 && punteroY < 610) {
        estado = 2; // Cambiar al estado de créditos
        if (comenzarReproducido == false) {
          comenzar.play();
          comenzarReproducido = true;
        }
           } else if (punteroX > -700 && punteroX < -500  && punteroY > 630 && punteroY < 690) {
        estado = 5; // Cambiar al estado de tutorial
        if (comenzarReproducido == false) {
          comenzar.play();
          comenzarReproducido = true;
        }
      }
    } else if (estado == 2) { // Si estamos en la pantalla de créditos
      if (punteroX <= -(width*3/4 - 100) && punteroX >= -(width*3/4 + 100) &&
        punteroY >= height/2 + 110 && punteroY <= height/2 + 230) {
        estado = 0; // volver a inicio
        if (comenzarReproducido == false) {
          comenzar.play();
          comenzarReproducido = true;
        }
      } else {
        comenzarReproducido = false;
      }
    } 
     else if (estado == 5) { // Si estamos en la pantalla de tutorial
      if (punteroX <= -(width*3/4 - 100) && punteroX >= -(width*3/4 + 100) &&
        punteroY >= height-120 && punteroY <= height-60) {
        estado = 0; // volver a inicio
        if (comenzarReproducido == false) {
          comenzar.play();
          comenzarReproducido = true;
        }
      } else {
        comenzarReproducido = false;
      }
    } 
    else if (estado == 3 || estado == 4) { // Si estamos en la pantalla de perder o ganar
      if (punteroX <= -(width*3/4 - 100) && punteroX >= -(width*3/4 + 100) &&
        punteroY >= height/2 + 110 && punteroY <= height/2 + 230) {
        estado = 0; // volver a inicio
        juego.resetScore();
        if (comenzarReproducido == false) {
          comenzar.play();
          comenzarReproducido = true;
        }
      } else {
        comenzarReproducido = false;
      }
    }
  }
}

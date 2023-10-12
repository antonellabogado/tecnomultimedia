class Pantalla {
  Juego juego;

  PImage inicio, btnJugar, btnCreditos, btnVolver, btnTutorial, ganaste, perdiste, creditos, puntos, fondo, gato, estante, flechaArriba, flechaDerecha, flechaIzquierda, flechaArribaIzquierda, flechaArribaDerecha;

  // Botones
  float btnX = width/2 - 125;
  int btnJugarY = 470;
  int btnCreditosY = 550;
  float btnVolverX = width / 2 + 170;
  int btnVolverY = height / 2 + 170;
  int btnAncho = 237;
  int btnAlto = 60;

  Pantalla() {
    inicio = loadImage("fondoInicio.png");
    ganaste = loadImage("fondoGanar.png");
    perdiste = loadImage("fondoPerder.png");
    creditos = loadImage("fondoCreditos.png");

    btnJugar = loadImage("jugar.png");
    btnCreditos = loadImage("creditos.png");
    btnVolver = loadImage("volver.png");
    btnTutorial =loadImage("tutorial.png");
    puntos = loadImage("score.png");

    fondo = loadImage("fondoTutorial.png");
    estante = loadImage("estanteChico.png");
    gato=  loadImage("gato0.png");
    flechaArriba=  loadImage("flecha.png");
    flechaDerecha=  loadImage("flechaDerecha.png");
    flechaIzquierda=  loadImage("flechaIzquierda.png");
    flechaArribaIzquierda=  loadImage("flecha.png");
    flechaArribaDerecha=  loadImage("flecha.png");
  }

  void displayInicio() {
    image(inicio, 0, 0, width, height);
    image(btnJugar, btnX, btnJugarY);
    image(btnCreditos, btnX, btnCreditosY);
    image(btnTutorial, btnX, btnCreditosY+80);
  }

  void displayCreditos() {
    image(creditos, 0, 0, width, height);
    image(btnVolver, btnVolverX, btnVolverY, btnAncho, btnAlto);
  }

  void displayFinalizar(int estado) {
    if (estado == 3) image(ganaste, 0, 0, width, height);
    if (estado == 4) image(perdiste, 0, 0, width, height);

    image(puntos, width/2 - 105, height * 2/4 + 67);
    fill(255);
    textSize(25);
    text(score, width/2 + 20, height * 2/4 + 100);
    image(btnVolver, btnVolverX, btnVolverY, btnAncho, btnAlto);
  }

  void displayTutorial() {
    image(fondo, 0, 0);
    image(btnVolver, btnVolverX, height-100, btnAncho, btnAlto);
  }
}

class Juego {
  FWorld mundo;
  FBox gato, marco, marco2, cajaFuerte, tv, copa, copa2, peluche, suelo, estante1, estante2, estante3, estante4, estante5, estante6, estante7, estante8, estante9, ventilador;
  FCircle pelota;

  // Ventilador
  float ventiladorX = width/2+80;
  float ventiladorY = height * 14/20;

  // Animación gato caminando
  int tiempoEntreCambios = 200;  // Tiempo en milisegundos entre cada cambio de imagen de las patitas
  int ultimoCambio = 0;  // Último momento en el que se cambió la imagen

  float rectX = 1280/2;  // Posición inicial en X del rectángulo
  float rectY = 720/2;  // Posición inicial en Y del rectángulo

  // Cuenta regresiva
  int duracionTotalSegundos = 60; // Duración total
  int cuentaRegresiva;  // Tiempo restante
  int tiempoInicioCuentaRegresiva;  // Tiempo en que se inició
  
  // Sonido ultimos segundos
  boolean timerReproduciendo = false;
  int tiempoUltimaReproduccion;
  int intervaloReproduccion = 1000; // 1 segundo

  // Score
  boolean incrementarScorePeluche = true;
  boolean incrementarScoreCajaFuerte= true;
  boolean incrementarScorePelota= true;
  boolean incrementarScoreMarco= true;
  boolean incrementarScoreMarco2= true;
  boolean incrementarScoreTv= true;
  boolean incrementarScoreCopa= true;
  boolean incrementarScoreCopa2= true;

  //arreglo de elementos, tanto estantes, como cajas, como etc
  ArrayList<FBody> elementos = new ArrayList<FBody>();

  PImage[] imagenesGato;  // Arreglo para almacenar las imágenes del gato
  PImage[] imagenesGatoEspejado;  // Arreglo para almacenar las imágenes del gato espejadas

  PImage imgGato, imgGato1, gatoVolador, gatoVoladorEspejado, imgPelota, imgMarco, imgCajaFuerte, imgPeluche, imgTv, imgCopa, imgMarcoRoto, imgCopaRota, imgTvRota, imgVentilador;
  PImage imgEstante, imgEstanteGrandeInvertido, imgEstanteGrande, imgEstanteChico, imgEstanteMediano, fondo, time, puntos;

  int indiceImagenIzquierda = 0;  // Índice para la animación izquierda
  int indiceImagenDerecha = 0;    // Índice para la animación derecha

  Juego() {
    imgEstante = loadImage("estante.png");
    imgEstanteGrande = loadImage("estanteGrande.png");
    imgEstanteGrandeInvertido = loadImage("estanteGrandeInvertido.png");
    imgEstanteChico = loadImage("estanteChico.png");
    imgEstanteMediano = loadImage("estanteMediano.png");

    imgPelota = loadImage("pelota.png");
    imgMarco = loadImage("marco.png");
    imgCajaFuerte = loadImage("cajaFuerte.png");
    imgPeluche = loadImage("peluche.png");
    imgCopa = loadImage("copa.png");
    imgTv = loadImage("tv.png");
    imgVentilador = loadImage("ventilador.png");

    imgMarcoRoto = loadImage("marcoRoto.png");
    imgCopaRota = loadImage("copaRota.png");
    imgTvRota = loadImage("tvRota.png");

    imgGato = loadImage("gato0.png");
    gatoVolador = loadImage("gatoVolador.png");
    gatoVoladorEspejado = loadImage("gatoVoladorEspejado.png");

    fondo = loadImage("fondoJuego.png");
    puntos = loadImage("score.png");
    time = loadImage("time.png");

    //carga los arreglos de imagenes
    imagenesGato = new PImage[3];  //  3 es el número total de imágenes de la animación
    imagenesGatoEspejado = new PImage[3];

    for (int i = 0; i < imagenesGato.length; i++) {
      imagenesGato[i] = loadImage("gato" + i + ".png");
      imagenesGatoEspejado[i] = loadImage("gatoEspejado" + i + ".png");
    }

    mundo = new FWorld();
    mundo.setEdges();
    mundo.setGravity(0, 1200);

    displayObjetos();
    displayEstantes();
    displayGato();
    displayVentilador();
    displaySuelo();
  }

  FBox crearEstante(float ancho, float alto, int angulo, float x, float y, PImage img, String nombre) {
    FBox e = new FBox(ancho, alto);
    e.setPosition(x, y);
    e.setRotation(angulo);
    e.attachImage(img);
    e.setName(nombre);
    e.setGrabbable(false);
    e.setStatic(true);
    elementos.add(e);
    mundo.add(e);
    return e;
  }

  FBox crearBox(float ancho, float alto, float d, float x, float y, PImage img) {
    FBox objetoBox = new FBox(ancho, alto);
    objetoBox.setDensity(d);
    objetoBox.setPosition(x, y);
    objetoBox.attachImage(img);
    elementos.add(objetoBox);
    mundo.add(objetoBox);
    return objetoBox;
  }

  FCircle crearCircle(float tam, float x, float y, PImage img) {
    FCircle objetoCircle = new FCircle(tam);
    objetoCircle.setPosition(x, y);
    objetoCircle.attachImage(img);
    elementos.add(objetoCircle);
    mundo.add(objetoCircle);
    return objetoCircle;
  }

  void iniciarCuentaRegresiva() {
    tiempoInicioCuentaRegresiva = millis();
  }

  void actualizarCuentaRegresiva() {
    int tiempoTranscurrido = millis() - tiempoInicioCuentaRegresiva;
    int tiempoRestante = duracionTotalSegundos * 1000 - tiempoTranscurrido;
    cuentaRegresiva = max(0, tiempoRestante / 1000);  // Evita valores negativos
    
    // Sonido ultimos segundos
    if (cuentaRegresiva <= 10) {
      if (millis() - tiempoUltimaReproduccion >= intervaloReproduccion) {
        timer.play();
        tiempoUltimaReproduccion = millis(); // Actualizar el tiempo de última reproducción
      }
    } else {
      if (timerReproduciendo) {
        timer.stop();
        timerReproduciendo = false;
      }
    }
  }

  void displayVentilador() {
    ventilador = new FBox(100, 100);
    ventilador.setPosition(ventiladorX, ventiladorY);
    ventilador.attachImage(imgVentilador);
    mundo.add(ventilador);
  }

  void displayEstantes() {
    //superiores a inferior, de izquierda a derecha
    estante1 = crearEstante(250, 20, 0, width/2 - 350, height * 5/20, imgEstanteMediano, "estante1");
    estante2 = crearEstante(250, 20, 0, width/2 + 350, height * 5/20, imgEstanteMediano, "estante2");

    estante3 = crearEstante(250, 20, 60, width/2 - 600, height * 9/20, imgEstanteGrandeInvertido, "estante3");
    estante4 = crearEstante(300, 20, -60, width/2 + 600, height * 9/20, imgEstanteGrandeInvertido, "estante4");

    estante5 = crearEstante(200, 20, 0, width/2 - 150, height * 9/20, imgEstanteChico, "estante5");
    estante6 = crearEstante(200, 20, 0, width/2 + 150, height * 9/20, imgEstanteChico, "estante6");

    estante7 = crearEstante(200, 20, 0, width/2 - 300, height * 13/20, imgEstanteChico, "estante7");
    estante8 = crearEstante(200, 20, 0, width/2 + 300, height * 13/20, imgEstanteChico, "estante8");

    estante9 = crearEstante(300, 20, 0, width/2, height * 16/20, imgEstanteGrande, "estante9");
  }

  void displayObjetos() {
    pelota = crearCircle(50, width/4, height * 3/20, imgPelota);
    pelota.setRestitution(.8);

  //  cajaFuerte = crearBox(59, 66, 600, width/2, height * 14/20, imgCajaFuerte);
  //  cajaFuerte.setDensity(100);

    marco = crearBox(40, 40, 3, width * 3/4, height * 2/20, imgMarco);
    marco2 = crearBox(40, 40, 3, width * 1/4, height * 10/20, imgMarco);

    peluche = crearBox(57, 67, .2, width/2 - 150, height * 6/20, imgPeluche);
    peluche.setRestitution(0.1);

    tv = crearBox(62, 68, 1, width/2 + 300, height * 10/20, imgTv);

    copa = crearBox(40, 70, .5, width/2 + 150, height * 6/20, imgCopa);
    copa2 = crearBox(40, 70, .5, width/2 - 75, height * 14/20, imgCopa);
  }

  void displayGato() {
    gato = new FBox(40, 40);
    gato.setPosition(1000, 700);
    gato.attachImage(imgGato);
    gato.setRotatable(false);
    gato.setGrabbable(false);
    gato.setName("gato");
    mundo.add(gato);
  }

  void displaySuelo() {
    suelo = new FBox(width, 55);
    suelo.setPosition(width/2, height);
    suelo.setFill(255, 0, 0, 0);
    suelo.setNoStroke();
    suelo.setGrabbable(false);
    suelo.setStatic(true);
    suelo.setName("suelo");
    elementos.add(suelo);
    mundo.add(suelo);
  }

  void repelerDesdeUnPunto() {
    ArrayList<FBody> cuerpos = mundo.getBodies();

    float repulsionX = ventilador.getX(); // coordenada X para la repulsión
    float minY = ventilador.getY() - 50;// límite inferior del rango de repulsión en Y
    float maxY = ventilador.getY() + 100; // límite superior del rango de repulsión en Y

    for (FBody cuerpo : cuerpos) {
      float x = cuerpo.getX();
      float y = cuerpo.getY();

      // Verifica si el cuerpo está en el rango de repulsión
      if (y >= minY && y <= maxY && x > repulsionX && x < repulsionX+300) {
        // fuerza de repulsión hacia la derecha
        float forceX = 3000;
        cuerpo.addForce(forceX, 0);
      }
    }
  }

  boolean isTouchingElement() {
    for (FBody e : elementos) { // Para cada *e*(ese nombre elegi yo, puede ser cualquiera) de tipo *FBox* perteneciente al array *elementos*
      if (gato.isTouchingBody(e) && gato.getY() < e.getY()) return true;
    }
    return false;
  };

  void movimientoPlayer() {
    float triangleWidth = width/2;
    float triangleHeight = height/2;

    // Triángulo 1 (arriba izquierda)
    boolean isOverTriangle1 = isMouseOverTriangle(0, 0, -(triangleWidth - 100), 0, 0, triangleHeight);
    // Triángulo 2 (arriba derecha)
    boolean isOverTriangle2 = isMouseOverTriangle(-width, 0, -( width - triangleWidth + 100), 0, -width, triangleHeight);
    // Triángulo 3 (abajo izquierda)
    boolean isOverTriangle3 = isMouseOverTriangle(0, height, 0, height - triangleHeight, -triangleWidth, height);
    // Triángulo 4 (abajo derecha)
    boolean isOverTriangle5 = isMouseOverTriangle(-width, height/2, 0, height/2 , -(width /2), height);
 boolean isOverTriangle4 = isMouseOverTriangle(-width, height, - width, height - triangleHeight, -(width - triangleWidth), height);
    if (isOverTriangle1 && (gato.isTouchingBody(pelota) && gato.getY() < pelota.getY() || (gato.isTouchingBody(ventilador) && gato.getY() < ventilador.getY())|| isTouchingElement())) {
      gato.addForce(-30000, -90000);
      if (!salto.isPlaying()) salto.play();
    } else if (isOverTriangle2 && (gato.isTouchingBody(pelota) && gato.getY() < pelota.getY() ||(gato.isTouchingBody(ventilador) && gato.getY() < ventilador.getY())|| isTouchingElement())) {
      gato.addForce(30000, -90000);
      if (!salto.isPlaying()) salto.play();
    } else if (isOverTriangle3 && (gato.isTouchingBody(pelota) && gato.getY() < pelota.getY() ||(gato.isTouchingBody(ventilador) && gato.getY() < ventilador.getY())|| isTouchingElement())) {
      gato.addForce(-2000, 0);
    } else if (isOverTriangle4 && (gato.isTouchingBody(pelota) && gato.getY() < pelota.getY() ||(gato.isTouchingBody(ventilador) && gato.getY() < ventilador.getY())|| isTouchingElement())) {
      gato.addForce(4000, 0);
    } else if(isOverTriangle5&& !isOverTriangle1 && !isOverTriangle2 && (gato.isTouchingBody(pelota) && gato.getY() < pelota.getY() ||(gato.isTouchingBody(ventilador) && gato.getY() < ventilador.getY())|| isTouchingElement()) ) {
      gato.setVelocity(0, 0);}

    else if (punteroX >= 540 && punteroX <= 740 && punteroY < height/2 && (gato.isTouchingBody(pelota) && gato.getY() < pelota.getY() ||(gato.isTouchingBody(ventilador) && gato.getY() < ventilador.getY())|| isTouchingElement())) {
      gato.addForce(0, -90000);
      if (!salto.isPlaying()) salto.play();
    }
  }

  boolean isMouseOverTriangle(float x1, float y1, float x2, float y2, float x3, float y3) {
    float denominator = ((y2 - y3) * (x1 - x3) + (x3 - x2) * (y1 - y3));
    float a = ((y2 - y3) * (punteroX - x3) + (x3 - x2) * (punteroY - y3)) / denominator;
    float b = ((y3 - y1) * (punteroX - x3) + (x1 - x3) * (punteroY - y3)) / denominator;
    float c = 1 - a - b;
    return a >= 0 && a <= 1 && b >= 0 && b <= 1 && c >= 0 && c <= 1;
  }

  void score() {
    if (pelota.getY() > 660 && incrementarScorePelota) {
      crash.play();
      score++; // Incrementar el score
      incrementarScorePelota = false; // Evitar incrementar varias veces
    }
  //  if (cajaFuerte.getY() > 650 && incrementarScoreCajaFuerte) {
  //    score+=999;
  //    incrementarScoreCajaFuerte = false;
//    }
    if (peluche.getY() > 650 && incrementarScorePeluche) {
      crash.play();
      score+=2;
      incrementarScorePeluche = false;
    }
    if (tv.getY() > 650 && incrementarScoreTv) {
      crash.play();
      tv.attachImage(imgTvRota);
      score+=10;
      incrementarScoreTv = false;
    }
    if (marco.getY() > 660 && incrementarScoreMarco) {
      crash.play();
      marco.attachImage(imgMarcoRoto);
      score+=3;
      incrementarScoreMarco = false;
    }
    if (marco2.getY() > 660 && incrementarScoreMarco2) {
      crash.play();
      marco2.attachImage(imgMarcoRoto);
      score+=3;
      incrementarScoreMarco2 = false;
    }
    if (copa.getY() > 650 && incrementarScoreCopa) {
      crash.play();
      copa.attachImage(imgCopaRota);
      score+=5;
      incrementarScoreCopa = false;
    }
    if (copa2.getY() > 650 && incrementarScoreCopa2) {
      crash.play();
      copa2.attachImage(imgCopaRota);
      score+=5;
      incrementarScoreCopa2 = false;
    }
  }

  void resetScore() {
    incrementarScorePelota = true;
    incrementarScoreCajaFuerte = true;
    incrementarScorePeluche = true;
    incrementarScoreMarco = true;
    incrementarScoreMarco2 = true;
    incrementarScoreTv = true;
    incrementarScoreCopa = true;
    incrementarScoreCopa2 = true;

    copa.attachImage(imgCopa);
    copa2.attachImage(imgCopa);
    marco.attachImage(imgMarco);
    marco2.attachImage(imgMarco);
    tv.attachImage(imgTv);
  }

  boolean isJumping() {
    for (FBody e : elementos) {
      if (!gato.isTouchingBody(e) && gato.getY() <= e.getY()) return true;
    }
    return false;
  }

  void espejarGato() {
    int tiempoActual = millis();
    if (tiempoActual - ultimoCambio >= tiempoEntreCambios) {

      if (punteroX < -gato.getX()) {
        // Si el mouse está a la izquierda del gato, cambia la imagen a la izquierda
        gato.attachImage(imagenesGato[indiceImagenDerecha]);
        indiceImagenDerecha = (indiceImagenDerecha + 1) % imagenesGato.length;

        if (isJumping()) gato.attachImage(gatoVolador);
      } else if ( punteroX >= -gato.getX()) {
        gato.attachImage(imagenesGatoEspejado[indiceImagenIzquierda]);
        indiceImagenIzquierda = (indiceImagenIzquierda + 1) % imagenesGatoEspejado.length;

        if (isJumping()) gato.attachImage(gatoVoladorEspejado);

        //} else if ( punteroX >= -gato.getX() && !isJumping()) {
        //  Si el mouse está a la derecha del gato, cambia la imagen a la derecha
        //  gato.attachImage(gatoVoladorEspejado);

        //} else if ( punteroX < -gato.getX() && !isJumping()) {
        //  Si el mouse está a la derecha del gato, cambia la imagen a la derecha
        //  gato.attachImage(gatoVolador);
      }

      // Actualiza el tiempo del último cambio de imagen
      ultimoCambio = tiempoActual;
    }
  }

  void jugar() {
    background(0);
    image (fondo, 0, 0, width, height);
    noStroke();
    fill(255);
    textSize(25);
    image(puntos, width/2 - 500, 30);
    text(score+"", width/2 - 375, 63);
    image(time, width/2 + 275, 30);
    text(cuentaRegresiva+"", width/2 + 375, 63);
    movimientoPlayer();

    espejarGato();
    repelerDesdeUnPunto();
    score();
    mundo.step();
    mundo.draw();
  }
}

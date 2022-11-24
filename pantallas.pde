class Pantalla {
  PFont fuente;
  PImage fondo;
  
  Juego juego;
  Boton botonJugar;
  Boton botonInstrucciones;
  Boton botonCreditos;
  Boton botonAtras;
  Boton botonReiniciar;
  Boton botonInicio;
  
 Pantalla() {
   fondo = loadImage("fondo.png");
   fuente = createFont("font.ttf", 80);
   textFont(fuente);
   
   dibujarBotones();
 }
 
 void dibujarBotones() {
   botonJugar = new Boton(width/2, height/2 + 25, 130, 50, "JUGAR");
   botonInstrucciones = new Boton((width/2)/2, height/2 + 100 , 130, 50, "Instrucciones");
   botonCreditos = new Boton((width/2)/2 + width/2, height/2 + 100 , 130, 50, "Créditos");
   botonAtras = new Boton(45, 45, 50, 50, null);
   botonReiniciar = new Boton((width/2)/2, height/2 + 100 , 130, 50, "Reiniciar");
   botonInicio = new Boton((width/2)/2 + width/2, height/2 + 100 , 130, 50, "Inicio");
 }
 
 void dibujarInicio() {
   background(fondo);
   fill(0);
   textSize(80);
   text("KITTENS GAME", width/2, height/3);
   textSize(32);
   botonJugar.dibujarBotonRect();
   textSize(16);
   botonInstrucciones.dibujarBotonRect();
   botonCreditos.dibujarBotonRect();
 }
 
 void dibujarInstrucciones() {
   background(fondo);
   textSize(24);
   text("INSTRUCCIONES", width/2, height/3);
   text("El objetivo es que el gatito atrape \n la mayor cantidad de bolas de lana, \n pero ¡OJO! si lo mojas con agua perdes. \n ¡Mueve al gatito con las flechas!", width/2, height/2);
   botonAtras.dibujarBotonCirc();
 }
 
 void dibujarCreditos() {
   background(fondo);
   textSize(24);
   text("CRÉDITOS", width/2, height/3);  
   text("Desarrollado por Antonella Bogado Benuzzi \n Comisión 3 de Tecnología Multimedial 1 \n Diseño Multimedial UNLP", width/2, height/2);
   botonAtras.dibujarBotonCirc();
 }
 
 void dibujarGanar() {
   background(fondo);
   fill(255);
   textSize(72);
   text("¡Ganaste!", width/2, 200);
   textSize(24);
   botonInicio.dibujarBotonRect();
   botonReiniciar.dibujarBotonRect();
 }
 
 void dibujarPerder() {
    background(fondo);
    fill(255);
    textSize(72);
    text("Perdiste :(", width/2, height/3);
    textSize(24);
    botonInicio.dibujarBotonRect();
    botonReiniciar.dibujarBotonRect();
 }
}

// TP#5: Programación Orientada a Objetos
// Antonella Bogado Benuzzi 81745/3
// Comisión 3
// Link a youtube

Principal principal;
import processing.sound.*;
SoundFile file;

void setup() {
  size(600, 600);
  principal = new Principal();
  
  file = new SoundFile(this, "musica.mp3");
}

void draw() {
  principal.dibujar();
  if(!file.isPlaying()){
      file.play(1);
  }
}

void mousePressed() {
  principal.cambiarDeEstado();
}

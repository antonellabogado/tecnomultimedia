// TP#2: Ilusión óptica interactiva
// Antonella Bogado Benuzzi 
// 81745/3 
// Comisión 3 
// https://youtu.be/dcCQZLM7MiQ

int posX = 100; // posición inicial de la ellipse
color texto = color(255, random(220), random(220));

void setup() {
  size(600, 600);
  ellipseMode(CENTER);
}

void draw() {
  for (int n=0; n<width; n++){    
    float tono = n*255/width;
    stroke(tono, 0, 0);
    line(n, 0, n, height);
  }
  dibujarCirculos();
  dibujarBoton();
}

void keyPressed() { // movimiento ellipse 
  if (key == CODED) {
    if(keyCode == RIGHT) {
      posX+=5;
    } else if (keyCode == LEFT) {
      posX-=5;
     }
  }
} 

void mousePressed() { // restauración de variables
  if (mouseX >= 540 && mouseX <= 580 && mouseY >= 540 & mouseY <= 580){
    posX = 100;
  }
}

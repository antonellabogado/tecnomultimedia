// TP#4: Programando con objetos
// Antonella Bogado Benuzzi 81745/3
// Comisión 3 
// https://youtu.be/K6xqMvmQrsw
// https://docs.google.com/document/d/1wJMALaTRv5DHop5rA7OEpmILRYodwMi7wNElMy3fA3w/edit?usp=sharing

// variable de estado
int estado=0;

// declaración de objetos
Principal principal;
Boton boton;

void setup(){
  size(600, 600);
  textAlign(CENTER, CENTER);
  noStroke();
  
  // construcción de objetos
  principal = new Principal();
  boton = new Boton(color(0), color(255), "Noche");
}

void draw(){
  background(0);
  
  // lógica de estados
  if (estado == 0){
    principal.dibujarNoche();
    
    boton.colorBoton = color(255);
    boton.colorTexto = color(0);
    boton.texto = "Día";
    boton.dibujar();
  } else if (estado == 1){
    principal.dibujarDia();
    
    boton.colorBoton = color(0);
    boton.colorTexto = color(255);
    boton.texto = "Noche";
    boton.dibujar();
  }
}

void mousePressed(){
  // colisión con botón para cambiar noche/día
  if (mouseX >= boton.x && mouseX <= (boton.x + boton.tamX) && mouseY >= boton.y && mouseY <= (boton.y + boton.tamY)){ 
    if (estado==0){
      estado = 1;
    } else if (estado==1){
      estado = 0;
    }
  }
}

class Boton{
  // propiedades
  float x, y, tamX, tamY;
  color colorBoton, colorTexto;
  String texto;
  
  // constructor
  Boton(color colorBoton, color colorTexto, String texto){
    this.colorBoton = colorBoton;
    this.colorTexto = colorTexto;
    this.texto = texto;
    
    x = 490;
    y = 540;
    tamX = 100;
    tamY = 50;
  }
  
  // métodos
  void dibujar(){
    fill(colorBoton);
    rect(x, y, tamX, tamY, 20);
    fill(colorTexto);
    textSize(24);
    text(texto, x + tamX/2, y + tamY/2);
  }
}

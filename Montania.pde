class Montania{
  // propiedades
  int x, y, tam;
  float vel;
  color colorMontania;
  
  // constructor
  Montania(int x, int y, int tam, float vel, color colorMontania){
    this.x = x;
    this.y = y;
    this.tam = tam;
    this.vel = vel;
    this.colorMontania = colorMontania;    
  }
  
  // métodos
  void dibujar(){
    fill(colorMontania);  
    ellipse(x, y, tam, tam);
  }
  
  void mover(){
    x-=vel;
    if (x < -tam/2){
      x = width+tam/2;
    } 
  }
}

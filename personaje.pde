void eligeATuPersonaje () {
  // dibuja la pantalla para elegir al personaje
  
  push();
  background(242);
  fill(0);
  textSize(40);
  text("Elige a tu personaje", width/2, 50);
  
  fill(252, 171, 235);
  botonCircular(width/2, height/3, 180, 180);
  image(gato[0], width/2, height/3);
  fill(188, 192, 255);
  botonCircular((width/2)/2, height/3 + 200, 180, 180);
  image(gato[1], (width/2)/2, height/3 + 200);
  fill(166, 250, 139);
  botonCircular((width/2)/2 + width/2, height/3 + 200, 180, 180);
  image(gato[2], (width/2)/2 + width/2, height/3 + 200);
  pop();  
  
}

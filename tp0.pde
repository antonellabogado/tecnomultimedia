PFont fuente;

void setup(){
  size(500,500); //establece el tamaño de la ventana
  fuente = loadFont("centurygothic.vlw");
  textFont(fuente, 100);
 
}

void draw(){
  background(98,74,193); 
  fill(255,90); // relleno la elipse de blanco 
  noStroke(); // le quito el borde a la elipse
  ellipse(250,250,500,500);
  textAlign(CENTER); // configuro la alineación del texto
  textSize(100); // configuro el tamaño del texto
  text("Antonella",250,475);
  
  
  
  // CABEZA
  fill(255,235,180); // relleno del rectángulo
  noStroke(); // quito el borde del rectángulo 
  rect(125,75,250,300,160,160,140,140);
  
  // OJOS 
  stroke(0); // pongo el borde de las siguientes figuras
  strokeWeight(1); // establezco el ancho del borde
  
  fill(255); // relleno de blanco la elipse
  ellipse(187.5,200,80,55);
  fill(20,200,70); // relleno de verde la elipse
  ellipse(187.5,200,45,45);
  fill(0); // relleno de negro la elipse
  ellipse(187.5,200,20,20);
  fill(255); // relleno de blanco la elipse
  ellipse(195,195,8,8); // dibujo el brillito 
  
  fill(255); // relleno de blanco la elipse
  ellipse(312.5,200,80,55);
  fill(20,200,70); // relleno de verde la elipse
  ellipse(312.5,200,45,45);
  fill(0); // relleno de negro la elipse
  ellipse(312.5,200,20,20);
  fill(255); // relleno de blanco la elipse
  ellipse(320,195,8,8); // dibujo el brillito 
  
  // NARIZ
  
  strokeWeight(6); // establezco el ancho de las líneas
  stroke(203,164,97); // elijo el color de las líneas
  line(235,175,215,275);
  line(215,275,265,275);
 
 
  // PELO
  stroke(0); // establezco el color de las líneas
  strokeWeight(51); //cambio el ancho de las líneas
  stroke(170,126,50); // relleno las líneas a continuación 
  line(250,75,125,150);
  line(250,75,375,150);
  line(125,150,125,375);
  line(375,150,375,375);
  
  // BOCA
  strokeWeight(5); // cambio el ancho de las líneas
  stroke(0); // elijo el color de las lineas
  line(200,330,240,340); // dibujo las lineas
  line(280,330,240,340);

  
  
}

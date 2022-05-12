/* TP#1: Animando con código 
   Antonella Bogado Benuzzi 
   81745/3 
   Comisión 3 
*/
   
// DECLARACIÓN DE VARIABLES
float titulo;                   // tamaño del título y botón
float posNx, posNy;             // posición en X e Y de la nube
float posGx, posGy;             // posición en X e Y de la sección guión
float posRx;                    // posición en X de la pantalla verde
float personajes;               // posición en Y de la sección personajes
float globosInicial;            // posición en Y de los globos
color celeste, verde;           // pantallas
String listaPersonajes;         // línea de texto personajes
PFont fontTitulo, font;         // fuentes
PImage nube, globos;            // imagenes

void setup(){
  size(400, 400);
  
  rectMode(CENTER);          
  textAlign(CENTER, CENTER);
  
  titulo = 1;                // valor inicial del tamaño del título
  
  celeste = color(153, 215, 216); // color de 
  verde = color(161, 234, 102);   // las pantallas
  
  nube = loadImage("nube.png"); // cargo la imagen de la nube
  posNy = 95;                   // posición en Y de la nube
  posNx = -10000;               // posición inicial de la nube
  
  posRx = -200;                 // posición inicial de la pantalla verde
  
  font = loadFont("arialrounded.vlw");      // carga de 
  fontTitulo = loadFont("trebuchet.vlw");   // fuentes
  
  globos = loadImage("globos.png"); // cargo la imagen de los globos
  personajes = 800;                 // posición inicial de la sección personajes
  globosInicial = 350;              // posición inicial de los globos
  listaPersonajes = "PERSONAJES:\nCarl Fredericksen - Edward Asner\nRussel - Jordan Nagai\nDug - Bob Peterson\nAplha - Bob Peterson\nCharles Muntz - Christopher Plummer\nEllie - Elie Docter\nBeta - Delroy Lindo\nGamma - Jerome Ranft\nOmega - Josh Cooley\nKevin - Kevin\nEnfermero George - Donald Fullilove\nEnfermero A.J. - Jess Harnell\nLider explorador - Pete Docter\nMatya - Zelda Williams\nSteve - Danny Mann\nLila Kis - Rachael Murphy\nOficial Edith - Mickie McGowan\nDavis - Kevin Corrigan\nAnca - Elena Satine\nHaber Spikeri - Murat Sen\nBeng - Robert Towers\nJosh Petri - Henry Thomas\nClaire - Alyssa Sutherland\nGarret - Shiloh Fernandez\nWadim - David Dayan Fisher";

}

void draw(){
  background(celeste); // pantalla celeste
  
  // CRÉDITOS 
  textFont(font);                // fuente de los créditos
  fill(0);                       // color de los créditos
  textSize(18);                  // tamaño del texto 

  // TÍTULO "UP"
  if (titulo < 130){ // si el tamaño del título es menor a 130, aumenta su tamaño
    titulo++; 
  } else if (titulo == 130){ // el tamaño se mantiene en 130
    titulo = 130; 
    pushStyle();  // guardo la configuración de estilos
    fill(255);    // color del botón
    rect(width/2, 300, 300, 30, 30); // botón
    popStyle();   // reseteo la configuración de estilos
    text("Click aquí para ver los créditos", width/2, 300); 
  } 
 
  pushStyle();                   // guardo la configuración de estilos
  textFont(fontTitulo);          // fuente del título
  fill(255);                     // color del título
  textSize(titulo);              // tamaño del título
  text("UP!", width/2, height/2); // título
  popStyle();                    // reseteo la configuración de estilos
 
  
  if (posNx >= 0 && posNx <= 45){   // si la nube alcanza al título, se limpia la pantalla 
  
    background(celeste); 
    
  } else if( posNx > 45 && posNx <= 400){ // si la nube supera los 45px, aparecen los créditos -> DIRECCIÓN
    
    background(celeste);
    text("DIRECCIÓN:\nPeter Docter y Bob Peterson", width/2, height/2);
    
  } else if (posNx > 400 && posNx <= 500){ // si la nube desaparece de la pantalla, cambia el texto -> PRODUCCIÓN
  
    background(celeste); 
    text("PRODUCCIÓN:\nJonas Rivera\nJohn Lasseter\nAndrew Stanton", width/2, height/2);
    
  } else if (posNx > 500 && posNx <= 950){ // si la nube supera 500px, aparece una nueva pantalla de créditos -> GUIÓN
  
    background(celeste);                                                                 //    sección de 
    text("PRODUCCIÓN:\nJonas Rivera\nJohn Lasseter\nAndrew Stanton", width/2, height/2); //  crédito anterior
    
    pushStyle();    // guardo la configuración de estilos
    fill(verde);                            //  pantalla
    noStroke();                             //   color
    rect(posRx, height/2, width, height);   //   verde
    popStyle();     // reseteo la configuración de estilos
    text("GUIÓN:\nBob Peterson - Pete Docter\nThomas McCarthy - Jim Capobianco", posRx, height/2); 
    
    if (posRx < width/2){   // si la posición en X de la pantalla verde es menor a la mitad del ancho la pantalla, sigue moviendose en X
      posRx ++;
    } else if (posRx == width/2){  // si la posición en X de la pantalla verde es igual a la mitad del ancho de la pantalla, se mantiene en esa posición
      posRx = width/2;
    }
    
  } else if (posNx > 950){ // si la posición en X de la nube supera los 950px, aparece una nueva pantalla de créditos -> PERSONAJES
    background(verde);
    image(globos, width/2 - 75, globosInicial, 150, 170);    
    text(listaPersonajes, width/2, personajes);
    globosInicial--;
    personajes--; // los globos y la lista de personajes van subiendo
  }
  
  // NUBE
  image(nube, posNx, posNy, 360, 276.6);
  posNx ++;  // varación de la posicion en X de la nube  

}

void mousePressed(){
 if (mouseX > width/2 - 150 && mouseX < width/2 + 150 && mouseY > 285 && mouseY < 315){ // si hago click en el botón, comienzan los créditos
  posNx = -350;  // nueva posición inicial de la nube
 }
} 

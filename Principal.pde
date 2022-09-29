class Principal{
  // declaración de objetos
  Estrella[] estrellas = new Estrella[100];
  Nube nubes;
  Montania[] montaniasFondo = new Montania[3];
  Montania[] montanias = new Montania[6];
  Auto autos;
  
  // constructor
  Principal(){
    // construcción de objetos
    for (int i=0; i < estrellas.length; i++){
      estrellas[i] = new Estrella();
    }
    
    nubes = new Nube();
    
    montaniasFondo[0] = new Montania(0, 400, width/2, 1, color(32, 77, 24));
    montaniasFondo[1] = new Montania(width/2, 400, width/2, 1, color(32, 77, 24));
    montaniasFondo[2] = new Montania(width, 400, width/2, 1, color(32, 77, 24));
    
    montanias[0] =  new Montania(-75, 400, 150, 2.5, color(66, 184, 45));
    montanias[1] =  new Montania(75, 400, 150, 2.5, color(66, 184, 45));
    montanias[2] =  new Montania(225, 400, 150, 2.5, color(66, 184, 45));
    montanias[3] =  new Montania(375, 400, 150, 2.5, color(66, 184, 45));
    montanias[4] =  new Montania(525, 400, 150, 2.5, color(66, 184, 45));
    montanias[5] =  new Montania(675, 400, 150, 2.5, color(66, 184, 45));
    
    autos = new Auto();
  }
  
  // métodos
  void dibujarNoche(){
    // cielo
    for (int i=0; i < estrellas.length; i++){
      estrellas[i].dibujar();
      estrellas[i].mover();
    }   
    
    // montañas
    for (int i=0; i < montaniasFondo.length; i++){
      montaniasFondo[i].colorMontania = color(32, 77, 24);
      montaniasFondo[i].dibujar();
      montaniasFondo[i].mover();
    }
     for (int i=0; i < montanias.length; i++){
      montanias[i].colorMontania = color(66, 184, 45);
      montanias[i].dibujar();
      montanias[i].mover();
    }
    
    // autos
    autos.dibujar();
    autos.mover();

  }
  
  void dibujarDia(){
    // cielo
    nubes.dibujar();
    nubes.mover();
    
    // montañas
    for (int i=0; i < montaniasFondo.length; i++){
      montaniasFondo[i].colorMontania = color(47, 203, 18);
      montaniasFondo[i].dibujar();
      montaniasFondo[i].mover();
    }
    for (int i=0; i < montanias.length; i++){
      montanias[i].colorMontania = color(81, 238, 52);
      montanias[i].dibujar();
      montanias[i].mover();
    }
    
    // autos
    autos.dibujar();
    autos.mover();
  }
}

class Abejitas {



  PImage Abejitas, lluvia ;
  PImage [] flor  = new PImage[5];
  float mov_X_L, mov_Y_L;
  float vel_L = 10;
  int i, flores, floresG =0;
  float mov__ = -2;
  float mov_y = 130;
  int posX_F, posY_F;
  boolean perdiste = false;


  Abejitas() {

    Abejitas = loadImage("abejita.png");
    lluvia = loadImage("lluvia.png");
    flor[0] = loadImage("flor1.png");
    flor[1] = loadImage("flor2.png");
    flor[2] = loadImage("flor3.png");
    flor[3] = loadImage("flor4.png");
    mov_X_L = random(200, 500);
    mov_Y_L = -100;

    posX_F = width/2;
    posY_F = -990;
  }

  void dibujar1() {
    juego();
    EnJuego.play();

    image(Abejitas, 50, mov_y, 200, 200);
    image(Abejitas, 400, mov_y, 200, 200);

    push();
    imageMode(CENTER);
    noCursor();
    image(Abejitas, mouseX, mouseY, 200, 200);
    pop();

    mov_y-= -mov__;
    mov_Y_L-= -vel_L;
    posY_F+=10;

    text("Flores:", 450, 100 );
    text(floresG, 550, 100 );

    if (perdiste) {
      estados.perdiste();
      mov_Y_L = 0;
      posY_F = -990;
    }
  }
  void juego() {



    push();


    if (mov_y < 90.0 ) { // mov__ es un valor negativo y al restarlo por otro negativo se vuelve positivo

      mov__ = -mov__;
    } else if (mov_y > 150) {

      mov__ = -mov__;
    } else if (  posX_F <= mouseX+30  &&   posX_F >=  mouseX-30  && posY_F <= mouseY && posY_F >=mouseY-30) {

      agarrasteFlor.play();
      agarrasteFlor.rewind();
      mov_X_L = random(200, 500);
      i++;
      mov_Y_L = -100;
      posY_F = -990;
      flores++;
      floresG++;
      ganaste.rewind();
    }

    if (posY_F == 670) { //si la flor sale de la pantalla reinicia la lluvia
      mov_Y_L = -100;
      posY_F = -990;
      flores++;
    }
    if (i > 3) {   // si llega al casillero 3 del arreglo se reinicia
      i = 0;
    }
    if (flores == 10) { // si agarras 10 flores ganas y reinicia las variables
      estados.ganaste();
      ganaste.play();
      flores =0;
      floresG =0;
      i = 0;
    }
    imageMode(CENTER);

    image(flor[i], posX_F, posY_F, 100, 100);
    pop();


    for (int i = 0; i < 1000; i = i+100) {
      for ( int o = 0; o < 900; o = o+150) {
        push();
        imageMode(CENTER);
        image(lluvia, mov_X_L - i, mov_Y_L - o, 100, 100);
        image(lluvia, mov_X_L + i, mov_Y_L - o, 100, 100);
        pop();
        if ( (mov_X_L -i  <= mouseX+30 && mov_X_L - i >= mouseX-30   && mov_Y_L - o <= mouseY && mov_Y_L - o >=mouseY-30) ||
          (mov_X_L -i  <= mouseX+30 && mov_X_L - i >= mouseX-30   && mov_Y_L - o <= mouseY && mov_Y_L - o >=mouseY-30) ) {
          perdiste=true;
          floresG =0;
        }


        if ( (mov_X_L +i  <= mouseX+30 && mov_X_L + i >= mouseX-30   && mov_Y_L - o <= mouseY && mov_Y_L - o >=mouseY-30) ||
          (mov_X_L -i  <= mouseX+30 && mov_X_L - i >= mouseX-30   && mov_Y_L - o <= mouseY && mov_Y_L - o >=mouseY-30) ) {

          perdiste=true;
          floresG =0;
        }
      }
    }
  }
  void reiniciar() {
    perdiste = false;
  }
}

class Estados {
  Abejitas abejas;
  Fondo fondo;

  int estado= 1;


  Estados () {

    fondo = new Fondo();
    abejas = new Abejitas ();
  }
  void estados () {

    if (estado == 1) {

      fondo.F_Inicio();
      textSize(30);
      fill(255);
      text("Presiona ''ENTER'' para empezar", 100, 550);
    }



    if (estado == 2) {
      fondo.F_Juego ();
      abejas.dibujar1();
      EnJuego.play();
    }



    if (estado == 1 && keyPressed && key == ENTER) {
      estado = 2;
    } else if (estado == 3 && keyPressed && key == 'r' ||  key == 'R') {
      EnJuego.rewind();
      perdiste.rewind();
      abejas.reiniciar();
      estado = 1;
    } else  if ( estado == 4 && keyPressed && key == 'r' ||  key == 'R') {
      EnJuego.rewind();
      abejas.reiniciar();
      estado = 1;
    } else  if ( estado == 5 && keyPressed && key == 'r' ||  key == 'R') {
      EnJuego.rewind();
      abejas.reiniciar();
      estado = 1;
    }

    if (estado == 3 && keyPressed && key == 'm' ||  key == 'M') {
      Creditos();
    } else  if ( estado == 4 && keyPressed && key == 'm' ||  key == 'M') {
      Creditos();
    }


    if (estado == 3) {
      EnJuego.pause();
      EnJuego.rewind();
    } else if (estado == 4) {
      EnJuego.pause();
      EnJuego.rewind();
    }
  }
  void perdiste() {
    estado = 3;
    perdiste.play();
    perdiste.rewind();
    background(0);
    fondo.F_Perdiste();
    text("PERDISTE", 200, 500);
    text("Presiona R para reiniciar", 130, 550);
  }

  void ganaste() {

    EnJuego.pause();
    estado = 4;
    background(255);
    fill(0);
    fondo.F_Ganaste();
    text("GANASTE", 200, 450);
    text("Presiona R para reiniciar", 130, 500);
    text("Presiona M para Ver los creditos", 100, 550);
  }
  void Creditos() {
    estado = 5;
    background(255);
    fill(0);
    fondo.Creditos();
    text("Muscagorry Franco Agustín", 100, 450);
    text("Legajo : 91539/4", 150, 500);
    text("Presiona R para reiniciar", 100, 550);
  }
}

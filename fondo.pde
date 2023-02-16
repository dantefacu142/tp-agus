class Fondo {
  PImage Fondo, inicio, ganaste, perdiste, creditos;

  Fondo() {
    Fondo = loadImage("fondo.jpg");
    inicio = loadImage("inicio.png");
    ganaste = loadImage("ganaste.jpg");
    perdiste = loadImage("perdiste.png");
    creditos = loadImage("imgCreditos.jpg");
  }



  void F_Inicio() {
    image(inicio, 0, 0, width, height);
  }
  void F_Juego() {
    image(Fondo, 0, 0, width, height);
  }
  void F_Perdiste() {
    image(perdiste, 150, 100, width/2, height/2);
  }
  void F_Ganaste() {
    image(ganaste, 150, 100, width/2, height/2);
  }
  void Creditos() {
    image(creditos, 150, 100, width/2, height/2);
  }
}

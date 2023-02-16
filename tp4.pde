//importar biblioteca
import ddf.minim.*;
Minim minim;
// audioplayer para sonidos durareros
AudioPlayer EnJuego;
AudioPlayer ganaste;
AudioPlayer perdiste;
AudioPlayer agarrasteFlor;


Estados estados;
void setup() {
  size(600, 600);
  estados = new Estados();

  //carga de archivos mp3
  minim = new Minim(this);
  EnJuego = minim.loadFile("InGame.mp3");
  ganaste = minim.loadFile ("ganaste.mp3");
  perdiste = minim.loadFile ("perdiste.mp3");
  agarrasteFlor = minim.loadFile ("agarraste la flor.mp3");
}

void draw() {

  estados.estados();
}

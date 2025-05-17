//TP2
//COMISION 2
// FRANCO ORLANDI, 92996/2

String estado;
String titulo = "Geometry Dash\n CREADO por \n RobTop Games";
String body2 = "Geometry Dash es un videojuego de plataformas y videojuego rítmico\ncreado en 2013 por el desarrollador sueco Robert Topala\n(mas conocido como RobTop)";
String lite = "Tiene su version\nGeometry Dash lite, \npara que puedas\n disfrutar el juego sin pagar.";
String plataformastexto = "Esta disponible en\nAndroid, Windows y MAC";
String tituloboton = "Comenzar";
int pantalla, tiempoinicio;

int velocidad = 0;
int tamTexto = 1;
PImage fondo, cubo, fondo1, fondo2, superponer, p1, pfondo;
PFont fuente, fuente1;

float posYtextos = 450;
void setup() {

  size(500, 500);
  textAlign(CENTER, CENTER);

  estado = "pantalla-1";
  pantalla = 0;
  tiempoinicio = 0;
  tamTexto = 48;
  textSize(tamTexto);

  // IMAGENES GENERALES
  cubo = loadImage("cubos/cube25.png");

  // IMAGENES PANTALLA 0
  fondo = loadImage("fondo.png");

  // IMAGENES PANTALLA 1
  fondo1 = loadImage("Pantalla1/fondo.png");
  fondo2 = loadImage("Pantalla1/fondo1.jpg");
  superponer = loadImage("Pantalla1/superponer.jpg");

  // IMAGENES PANTALLA 3
  pfondo = loadImage("Pantalla2/fondo.jpg");
  p1 = loadImage("Pantalla2/iconos/1.png");

  // FUENTES
  fuente1 = loadFont("assets/fonts/FranklinGothic-Demi-49.vlw");
  fuente = loadFont("assets/fonts/eEsquadro-49.vlw");
  textFont(fuente);
  textSize(24);
  textAlign(TOP);
}

void draw() {

  if (pantalla > 0) {
    velocidad = frameCount - tiempoinicio;
  }

  println(mouseX, mouseY);


  //---------------------------PANTALLA 0 INICIO
  if (pantalla == 0) {
    image(fondo, 0, 0, width, height);

    textFont(fuente);
    textSize(30);
    textAlign(LEFT);

    fill(125, 0, 0);
    stroke(30);
    text(titulo, 134, 238);

    fill(0);
    rect(134, 310, 220, 40);

    fill(255);
    stroke(0, 100, 255);
    text(tituloboton, 163, 342);
    image(cubo, mouseX, mouseY, 50, 50);
  } else if (pantalla == 1) { //---------------------------PANTALLA 1
    image(fondo1, 0, 0, width, height);
    image(fondo2, mouseX, 0, width, height);
    textSize(20);
    fill(255, 164, 66);
    text(body2, 227, posYtextos, width/2, height/2);
    image(cubo, mouseX, mouseY, 50, 50);
    if (mouseX <= 255) {
      textFont(fuente, 10);
      image(superponer, 26, 176);
    }

    if (posYtextos > 100) {
      posYtextos = posYtextos - 1;
    }


    if (velocidad >= 60 * 5) {
      pantalla = 2;
    }
  } else if (pantalla == 2) { //---------------------------PANTALLA 2

    image(pfondo, 0, 0, width, height);
    image(p1, 0, 152, velocidad, 200);
    textSize(30);
    fill(255);
    text(lite, 0, velocidad);
    image(cubo, mouseX, mouseY, 50, 50);
    if (velocidad >= 60 * 10) {
      pantalla = 3;
    }
  } else if (pantalla == 3) { //---------------------------PANTALLA 3
    textAlign( CENTER, CENTER );
    image(fondo, 0, 0, width, height);
    if ( tamTexto <= 30 ) {
      tamTexto = tamTexto + 1;
    }
    textSize( tamTexto );
    fill( 255 );
    text( plataformastexto, 250, 250 );
    image(cubo, mouseX, mouseY, 50, 50);
    if (velocidad >= 60 * 15) {
      pantalla = 4;
    }
  } else if (pantalla == 4) { //---------------------------PANTALLA 4 REINICIO
    image(pfondo, 0, 0, width, height);
    fill(0);
    rect(123, 263, 220, 40);

    fill(255);
    stroke(0, 100, 255);
    text("Reiniciar", 233, 284);
    image(cubo, 122, 213, 50, 50);
  }
  if (pantalla > 0) {
    textSize(36);
  }
}

void mousePressed() {
  if (pantalla == 0) { // Boton comenzar
    if (mouseX >= 134 && mouseX <= 354 && mouseY >= 310 && mouseY <= 350) {
      pantalla = 1;
      tiempoinicio = frameCount;
    }
  }
  tamTexto = 1;

  if (pantalla == 4) { // Boton reinicio
    if (mouseX >= 123 && mouseX <= 343 && mouseY >= 263 && mouseY <= 303) {
      pantalla = 0;
      tiempoinicio = 0;
      velocidad = 0;
      posYtextos = 450;
      tamTexto = 1;
    }
  }
}

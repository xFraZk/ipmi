//TP2
//COMISION 5
// FRANCO ORLANDI, 92996/2
PImage fondo, imagen1, imagen2, imagen3, personajes, iconomenu, portada, abrirlibro;
PFont fuente, fuente1;
int pantalla, tiempo, diametro, animacion, limiteDeAnimacion, opacidad, tamTexto;
boolean CambioPantallas, animarTexto, animarTexto2;

///////// TEXTOS
String texto = "El principito es un cuento \n poético que viene \n acompañado de \n ilustraciones hechas con \n acuarelas por el mismo \n Saint-Exupéry. \n En él, un piloto \n se encuentra perdido \n en el desierto del Sahara \n después de que su avión \n sufriera una avería, pero \n para su sorpresa, es allí \n donde conoce a un \n pequeño príncipe \n proveniente de otro planeta.";
String textop2 = "Hay un momento en el \n que el principito \n explica que es una \n cuestión de disciplina. \n él dedica tiempo a \n limpiar su planeta.";
String texto2p2 = "Esto implica arrancar \n los brotes de baobabs \n para evitar que crezcan \n y destruyan su pequeño \n mundo. Este acto de \n limpiar su planeta cada \n día refleja la \n importancia de \n mantener nuestras \n responsabilidades y \n cuidar nuestro entorno, \n porque si dejamos que \n los problemas pequeños \n se acumulen, pueden \n convertirse en algo \n muy grande y difícil \n de manejar.";
// Movimiento
float y;
float speed = 1;

void setup() {
  size(640, 480);
    animacion= 0;
  limiteDeAnimacion= 300;
  opacidad = 0;
  tamTexto= 48;
  textSize(tamTexto);
  
  ///////// CARGAR IMAGENES
  fondo = loadImage("fondo.jpg");
  personajes = loadImage("fondo2.jpg");
  iconomenu = loadImage("icons/icono_menu.png");
  portada = loadImage("portada.png");
  abrirlibro = loadImage("icons/abrir_libro.png");
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
  
  // FUENTES
  fuente1 = loadFont("FranklinGothic-Demi-49.vlw");
  fuente = loadFont("eEsquadro-49.vlw");
  textFont(fuente);
  textSize(24);
  textAlign(TOP);
  
  ///////////////
  fill(18, 18, 18);
  
  tiempo = 0;
  pantalla = 0;
  diametro = width / 10;
  CambioPantallas = false;
  animarTexto = false;
  animarTexto2 = false;
  y = height;  

}

void draw() {
  animacion++;
  if (CambioPantallas) {
    tiempo++;
    if (tiempo >= 500) {
      animacion = 0;
      tiempo = 0;
      if (pantalla != 4) {
        pantalla++;
      }
    }
  }
    println(frameCount, tiempo);

  
  print("X: "); println(mouseY);
  print("Y: "); println(mouseX);

  if (pantalla == 0) {
    if (mouseX <= 255) {
tint(mouseX);
    }
    image(fondo, 0, 0, width, height);
   push();
    text("EL PRINCIPITO \n CREADO por \n Antoine de Saint-Exupery", 228, 126);
    pop();
    push();
    stroke(36, 120, 255);
    rect(387, 226, 174, 50);
    fill(255);
    text("COMENZAR", 411, 263);
    image(iconomenu, mouseX, mouseY, 80,80); // Seguimiento del mouse
    pop();
  } else if (pantalla == 1) {
    textFont(fuente1, 18);
    push();
    background(0,0,0);
    image(abrirlibro, 38, 115); //Al deslizar, atras del libro aparece el principito
    image(imagen1, mouseX, 0, width, height);
    ///////////////////////
    if (mouseX <= 255) {
    image(portada, 10, 58);
    tint(mouseX);
    }
    ///////////////////////
    textAlign(LEFT);
    textSize(20);
  fill(255, mouseY);
    text(texto, width/2 - 0, y);
    image(iconomenu, mouseX, mouseY, 80,80);
   pop();

    if (animarTexto) {
      y -= speed;  
      if (y < -200) {  
        y = height;
      }
    }

  } else if (pantalla == 2) {
    push();
    image(personajes, 0, 0, width, height);
    fill(0);
  textSize(20);
textFont(fuente1, 20);
    text("El Principito y los Baobabs", 26, 35);
    fill(24, 89, 14);
    image(iconomenu, mouseX, mouseY, 80,80);
    text(textop2, 50, animacion);
    
if (animacion < 255) {
      opacidad = animacion;
    }
    fill(0, opacidad);
    text(texto2p2, 417, 95, height/2);
    pop();
    if (animarTexto2) {
      y -= speed;  
      if (y < -200) {  
        y = height;
      }
    }
  } else if (pantalla == 3) {
    push();
    image(imagen3, 0, 0, width, height);
    fill(0);
    text("El Principito y el Farolero", 26, 35);
    textFont(fuente1, 20);
    if (animacion < 150) {
      if (tamTexto < 72) {
        tamTexto++;
      }
    } else {
      if (tamTexto > 27) {
        tamTexto--;
      }
    }
    textSize(tamTexto);
    fill(0, opacidad);
    image(iconomenu, mouseX, mouseY, 80,80);
    text("Había en él justo \n el lugar necesario \n para alojar un \n farol y un farolero", 61, 205);
    //El quinto planeta era muy curioso. \n Era el más pequeño de todos. \n Había en él justo el lugar necesario para alojar \n un farol \n y un farolero.
    pop();
  } else if (pantalla == 4) {
    image(fondo, 0, 0, width, height);
    push();

    fill(0, mouseY);
    text("Gracias", 0, mouseY);
    pop();

    push();
    circle(width/2, height/2, diametro);
    fill(255);
    textSize(12);
    textAlign(CENTER, CENTER);
    text("Reiniciar", width/2, height/2 );
    pop();
  }


}

void mouseClicked() {
  if (pantalla == 0) {
    if (mouseX >= 387 && mouseX <= 561 && mouseY >= 226 && mouseY <= 276) {
      pantalla = 1;
      tiempo = 0;
      CambioPantallas = true;
      animarTexto = true;  
    } 

  } else if(pantalla == 4) {
    if (dist(mouseX, mouseY, width/2, height/2) < diametro/2) {
      tiempo = 0;
      pantalla = 0; 
      textFont(fuente);
      textSize(24);
  CambioPantallas = false; 
  animarTexto = false; 
  animarTexto2 = false; 
  y = height; 
    }
  }
}

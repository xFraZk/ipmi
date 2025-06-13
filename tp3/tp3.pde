//TP3
//COMISION 2
//FRANCO ORLANDI, 92996/2
// https://youtu.be/N7BV_gYUxA0

PImage popArt;
int cant = 3;
int tam;
boolean color1, color2 = false;

void setup() {
  size(800, 400);
  popArt = loadImage("F_50.jpeg");
}

void draw() {
  background(255);
  image(popArt, 0, 0, 400, 400);

  tam = 400 / cant;

  for (int i = 0; i < cant; i++) {
    for (int y = 0; y < cant; y++) {
      int estado = calcularEstado(i, y);

      if (color2) {
        if (estado == 0) {
          fill(0, 102, 102);
        } else {
          fill(128, 128, 128);
        }
      } else if (color1) {
        if (estado == 0) {
          fill(255, 204, 0);
        } else {
          fill(255, 0, 127);
        }
      } else {
        if (estado == 0) {
          fill(36, 41, 184);
        } else {
          fill(6, 13, 29);
        }
      }


      dibujarBloqueConCirculo(400 + i * tam, y * tam, tam, estado);
    }
  }
}


void keyPressed() {
  if (key == 'c') {
    color1 = !color1;  
  } else if (key == 'd') {
    color2 = !color2;  
  } else if (key == 'r') {
    reiniciarTodo();
  }
}

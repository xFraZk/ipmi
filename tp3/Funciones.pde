
void dibujarBloqueConCirculo(int x, int y, int tam, int estado) {
  rect(x, y, tam, tam);


  if (color2) {
    if (estado == 0) {
      fill(128, 128, 128);
    } else {
      fill(0, 102, 102);
    }
  } else if (color1) {
    if (estado == 0) {
      fill(255, 0, 127);
    } else {
      fill(255, 204, 0);
    }
  } else {
    if (estado == 0) {
      fill(6, 13, 29);
    } else {
      fill(36, 41, 184);
    }
  }


  if (dist(x + 67, y + tam / 2, mouseX, mouseY) < tam / 2) {
    fill(random(255), 0, 0, 100); 
  }

  ellipse(x + 67, y + tam / 2, tam, tam);
}


int calcularEstado(int i, int j) {
  return (i + j) % 2;
}


void reiniciarTodo() {
  color1 = false;
  color2 = false;
}

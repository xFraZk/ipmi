//TP1
//Franco Orlandi
//COM2

PImage img;

void setup() {
  size(800, 400);
  img = loadImage("objeto.jpg");
}

void draw() {
  background(178, 165, 159);

  // Fondo negro (mesa)
  fill(212, 202, 203);
  noStroke();
  rect(400, 260, 400, 140);

  // Línea negra del fondo de la mesa
  stroke(0);
  strokeWeight(13);
  line(400, 259, 800, 259);

  // Sombra
  noStroke();
  fill(0, 0, 0, 98);  
  triangle(514, 253, 473, 287, 516, 321);


  // Bordes negros 
  stroke(0);
  strokeWeight(6);

  // Fila 1
  fill(219, 204, 25); 
  rect(510, 135, 60, 60);
  
  fill(216, 203, 197);         
  rect(570, 135, 60, 60);
  
  fill(217, 0, 8);   
  rect(630, 135, 60, 60);

  // Fila 2
  fill(216, 203, 197);         
  rect(510, 195, 60, 60);
  
  fill(217, 0, 8);   
  rect(570, 195, 60, 60);
  
  fill(255, 88, 10); 
  rect(630, 195, 60, 60);

  // Fila 3
  fill(124, 176, 40);   
  rect(510, 255, 60, 60);
  
  fill(228, 212, 28); 
  rect(570, 255, 60, 60);
  
  fill(217, 0, 8);   
  rect(630, 255, 60, 60);
  

  image(img, 0, 0, 400, 400);
}

void mouseClicked() {
  println("X: " + mouseX + " | Y: " + mouseY);
}

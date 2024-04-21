PImage img;

void setup () {
  size (800,400);
  img = loadImage("naranja.jpg");
}
void draw () {
    background(255);
  
  /// CIRCULO NARANJA ////
   image(img, 0, 0, 400,400);
   fill (255, 130, 41);
   ellipse(599, 184, 280, 270);
   
   /// CIRCULO BLANCO ///
  ellipseMode(CENTER);  
  fill (255);
  ellipse(599, 184, 240, 240);
  
   
  
  ///////// INTERIOR DE LA NARANJA/////////////
  beginShape(TRIANGLE_FAN); //Quería que los vértices se conectaran formando triángulos
  vertex(599, 184); // 
  int vertices = 8; // Acá defino la cantidad de vertices
  for (int i = 0; i <= vertices; i++) { // Arranco un bucle for que va desde 0 hasta la cantidad de vértices que quiero (en este caso, 8). Utilizo una variable i para seguir la cuenta de cuántas veces pasé por el bucle.
  float angle = map(i, 0, vertices, 0, TWO_PI); // En cada vuelta del bucle, calculo un ángulo que va desde 0 hasta TWO_PI. Uso la función map() para adaptar el valor de i a ese rango, asegurándome de que cada vértice tenga un ángulo distinto.
  
  /* Con las funciones trigonométricas cos() y sin(), calculo las coordenadas de cada vértice basándome en el ángulo que calculé antes. 
  Esto me permite ubicar los vértices alrededor de un punto central (599, 184) formando un patrón circular con un radio de 120 píxeles.*/
  float x = 599 + cos(angle) * 120;
  float y = 184 + sin(angle) * 120;
  
  //////////////////////////////
  fill(247, 159, 42);
  strokeWeight(4);
  stroke(255);
  vertex(x, y);
  }
  endShape();
  


}

void mouseClicked() {
  print ("X: "); println (mouseY);
  print ("Y: "); println (mouseX);

}

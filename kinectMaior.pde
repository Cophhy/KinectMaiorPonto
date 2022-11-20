class KinectTracker {

  int threshold = 700; 
  int[] depth;
  PImage display;
   
  KinectTracker() {
    kinect.initDepth();
    kinect.enableMirror(true);
    display = createImage(kinect.width, kinect.height, RGB); // cria uma imagem branca
  }
  
  void display() {
    PImage img = kinect.getDepthImage();
    int maior = kinect.height;
    int maiorX = 0;
    int maiorY = 0;
    int aux = 0;
    
    depth = kinect.getRawDepth();

    // conferindo
    if (depth == null || img == null) return;

    //redesenha a imagem para mostrar qual parte esta dentro do trashhold - roxo
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset = x + y * kinect.width;
        int rawDepth = depth[offset];
        int pix = x + y * display.width;

     //mudando a cor do que esta dentro do trashold
        if (rawDepth < threshold) {
          display.pixels[pix] = color(77, 0, 146);
          if(y < maior){
            maior = y;
            maiorX = x;
            maiorY = y;
            aux++;
          }
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Desenha a imagem
    image(display, 0, 0);
    if (aux != 0) {
    ellipse(maiorX, maiorY, 32, 32);
    fill(50, 100, 250, 200);
    noStroke();
    text("x: " + maiorX + "    " +  "y: " + maiorY, 10, 500);
   }
  }
}

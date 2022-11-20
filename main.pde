import org.openkinect.freenect.*;
import org.openkinect.processing.*;

KinectTracker tracker;
Kinect kinect;

void setup() {
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(255);
  //Mostrando a imagem
  tracker.display();

}

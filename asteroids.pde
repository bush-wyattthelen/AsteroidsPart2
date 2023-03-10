import java.util.*;

ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
Spaceship mainShip = new Spaceship(200, 400, 0, 0, 0);

static int numStars = 25;

public void setup() {
  
  for (int i = 0; i < numStars; i++) {
    stars.add(new Star(Math.random() * width, Math.random() * height));
  }
  
  asteroids.add(new Asteroid(400, 400, 1, 1));
  
  size(800, 800);
}

public void draw() {
  if (Math.random() < 0.015) {
    asteroids.add(new Asteroid());
  }
  
  background(0);
  
  for (int i = 0; i < stars.size(); i++) {
    stars.get(i).show();
  }
  
  for (int i = asteroids.size() - 1; i > 0; i--) {
    asteroids.get(i).move();
    asteroids.get(i).show();
    if (abs((float)asteroids.get(i).myCenterX) > 1200 || abs((float)asteroids.get(i).myCenterY) > 1200) {
      asteroids.remove(i);
    }
    else if (dist((float)asteroids.get(i).myCenterX, (float)asteroids.get(i).myCenterY, (float)mainShip.myCenterX, (float)mainShip.myCenterY) < 25) {
      asteroids.remove(i);
    }
  }
  
  mainShip.show();
  mainShip.move();
}

public void keyPressed() {
  if (key == 'a') {
    mainShip.turn(-10);
  }
  else if (key == 'd') {
    mainShip.turn(10);
  }
  else if (key == ' ') {
    mainShip.accelerate(0.5);
  }
}

int randomInt (int lower, int upper) {
  return (int)(Math.random() * (upper - lower + 1)) + lower;
}

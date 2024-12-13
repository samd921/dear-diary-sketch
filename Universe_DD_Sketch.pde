//Space Universe Dear Diary Sketch
class Planet {
  String name;
  float distance;  
  float x, y;      
  color planetColor;
  int observationDays;  


  Planet(String name, float distance, color planetColor) {
    this.name = name;
    this.distance = distance;
    this.planetColor = planetColor;
    this.x = random(width);
    this.y = random(height);
    this.observationDays = 0;  
  }

  void display() {
    fill(planetColor);
    noStroke();
    float size = map(distance, 384400, 78340000, 10, 200); 
    ellipse(x, y, size, size);
    
 
    textSize(20);
    fill(255);
    textAlign(CENTER, CENTER);
    text(name, x, y + size / 2 + 10);
    text("Days Observed: " + observationDays, x, y + size / 2 + 30);
  }

 
  void update() {
    x += random(-1, 1); 
    y += random(-1, 1); 
  }


  void incrementObservation() {
    observationDays++;
  }
}

Planet moon;
Planet mars;
Planet venus;

void setup() {
  size(800, 800);

  moon = new Planet("Moon", 384400, color(200, 200, 255)); 
  mars = new Planet("Mars", 78340000, color(255, 100, 100)); 
  venus = new Planet("Venus", 41400000, color(255, 255, 100)); 
}

void draw() {
  background(0); 
  

  moon.display();
  mars.display();
  venus.display();
  

  moon.update();
  mars.update();
  venus.update();
  

  stroke(255);
  line(width / 2, height, moon.x, moon.y);
  line(width / 2, height, mars.x, mars.y);
  line(width / 2, height, venus.x, venus.y);
}


void mousePressed() {
  
  float moonDist = dist(mouseX, mouseY, moon.x, moon.y);
  float marsDist = dist(mouseX, mouseY, mars.x, mars.y);
  float venusDist = dist(mouseX, mouseY, venus.x, venus.y);
  

  if (moonDist < marsDist && moonDist < venusDist) {
    moon.incrementObservation();
  } else if (marsDist < moonDist && marsDist < venusDist) {
    mars.incrementObservation();
  } else {
    venus.incrementObservation();
  }
}

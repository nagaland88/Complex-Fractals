class system {
////////Global Variables///////////////////////////////////////////
  Vec3D position;
  Vec3D previous_location;
  Vec3D display;
  int rec;
  String rule;
  color tr = #8b4513;
////////////Constructor////////////////////////////////////////////
  system(Vec3D _position, Vec3D _display, int _rec, String _rule) {
    
    position=_position;
    previous_location=_position.copy();
    display = _display;
    rec=_rec;
    rule=_rule;

///////////////Once the class is activated these functions will run only once//////////////////
    updatePosition();
    update();
    recursive_class();
  }
  
  void run () {
    randomSeed(_seed);
    display();
  }
  /////This class creates new instances of the system class until the exit condition is met///
  void recursive_class() {
    if (rec >0 ) {
  
      Vec3D posA = position.copy();
      Vec3D Starting_posA = display.copy();
      system newLSystemA = new system(posA, Starting_posA, rec-1, "A"); 

      ALSystem.add(newLSystemA);

      Vec3D posB = position.copy();
      Vec3D Starting_posB = display.copy();
      system newLSystemB = new system(posB, Starting_posB, rec-1, "B");  

      ALSystem.add(newLSystemB);

      Vec3D posC = position.copy();
      Vec3D Starting_posC = display.copy();
      system newLSystemC = new system(posC, Starting_posC, rec-1, "C");  

      ALSystem.add(newLSystemC);

      Vec3D posD = position.copy();
      Vec3D Starting_posD = display.copy();
      system newLSystemD = new system(posD, Starting_posD, rec-1, "D");  
      ALSystem.add(newLSystemD);      
    } 
  }
  
  /////Update positions based on rules 
  void updatePosition() {
    if (rule == "A") {     
      float angleZ=radians(angle_Z);
      display.normalize();
  //// Make branches different size as recursion goes on////
      display.scaleSelf(random(rec*100));  
      display.rotateZ(angleZ);
    }   
    if (rule == "B") {      
      float angleZ=radians(-angle_Z);
      display.normalize();
      //// Make branches different size as recursion goes on////
      display.scaleSelf(random(rec*100));
      display.rotateZ(angleZ);
    }
    if (rule == "C") {
      float angleX=radians(angle_X);
      float angleY=radians(angle_Y);
      display.normalize();
      //// Make branches different size as recursion goes on////
      display.scaleSelf(random(rec*100));     
      display.rotateX(angleX);
      display.rotateY(angleY);
    }
    if (rule == "D") {
      float angleX=radians(-angle_X);
      float angleY=radians(-angle_Y);
      display.normalize();
      //// Make branches different size as recursion goes on////
      display.scaleSelf(random(rec*100));
      display.rotateX(angleX);
      display.rotateY(angleY);
     
    }
  } 

  void update() {
    position.addSelf(display);
  }


  void display () {
    ///make branches thinner based on recursion///
    strokeWeight(0.05 * -(rec*10));
    ///progressively shift to the desired color////
    stroke(lerpColor(c2, tr, rec*0.15));
    ///draw the line between these two positions////
    line(position.x, position.y, position.z, previous_location.x, previous_location.y, previous_location.z);
  }
}



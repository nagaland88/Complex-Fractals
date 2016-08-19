//////Import Libraries//////////////////
import controlP5.*;
import java.awt.Frame;
import ddf.minim.*;
import peasy.*;
import toxi.geom.*;

///////Declare objects of the classes////
private ControlP5 cp5;
public Fractal myFractal;
public Complex_Fractal myComplex_Fractal;
public ControlFrame cf;
public Minim minim;
public AudioPlayer player;
public AudioPlayer player2;
public PeasyCam cam;
public system LSystem;

///////Buttons & Sliders///////////////

public float increase;
public color c2;
public color c3;
public float n=1;
public float add_Recursion;
public int Recursion_3D;
public boolean Tree=false;
public boolean Triangle=false;
public boolean Snowflake =false;
public boolean Music=false;
public boolean Mandle_Music=false;
public boolean j3lia=false;
public boolean Lsystem_3D=false;
public boolean taj_mahal=false;
public boolean M2ndelBrot=false;
public boolean M3ndelBrot=false;
public boolean MnndelBrot=false;
public boolean Shapes=false;
public boolean ComplexShapes=false;
public boolean Jnlia=false;
public boolean record;
public int _seed=0;
public float f;

////////Complex_Fractals Zooming Variables///////////////

public double window_width=0;
public double window_height=0;
public float w=5;
public float h=3;
public double xmin = -3;
public double ymin = -1.25;
//x from xmin to xmax
public double xmax = xmin + w;
//y  from ymin to ymax
public double ymax = ymin + h;

//////////////3D L-System_variables////////////////


public ArrayList <system> ALSystem;
public float angle_Z;
public float angle_X;
public float angle_Y;



void setup()

{
  size(800, 600, OPENGL);
  background(255);
  stroke(0, 0, 0, 64);
  gui();////External Frame
  minim = new Minim(this);///music class object
  player = minim.loadFile("Sakura.mp3");///Load Fractal song
  player2= minim.loadFile("Bach.mp3"); ////load Complex fractal song
  cam = new PeasyCam(this, width/2, height/2, 0, 800); ///Peasy cam starting position 
  hint(ENABLE_RETINA_PIXELS);//////Only works under retina Display on Mac pro
  
}


///////////Load the External Frame///////////////////////////
void gui() {
  cp5 = new ControlP5(this);
  // ControlFrame is instanziated.
  cf = addControlFrame("External Frame", 480, 380, 50, 150);////External frame size
}


///////////Hide and Show Buttons and Sliders//////////////////
void console() {

  if ((Shapes==true) && (ComplexShapes==false))
  {
    cf.control().getController("taj_mahal").show();
    cf.control().getController("Triangle").show();
    cf.control().getController("Snowflake").show();
    cf.control().getController("Tree").show();
    cf.control().getController("Lsystem_3D").show();


    if ((Tree==true) ||(Triangle==true) || (Snowflake==true) || (taj_mahal==true)) {

      cf.control().getController("Music").show();
      cf.control().getController("add_Recursion").show();
    }
    else if (Lsystem_3D==false) {
      cf.control().getController("Music").hide();
      cf.control().getController("add_Recursion").hide();
      cam.reset();
    }
  }
  else if ((Shapes==false) && (ComplexShapes==true))
  {
    cf.control().getController("j3lia").show();
    cf.control().getController("M3ndelBrot").show();
    cf.control().getController("M2ndelBrot").show();
    cf.control().getController("MnndelBrot").show(); 
    cf.control().getController("explorer").show();
    cf.control().getController("Mandle_Music").show();
    cf.control().getController("increase").show();
    cf.control().getController("Jnlia").show();
    
  }

  else {
    cf.control().getController("taj_mahal").hide();
    cf.control().getController("Triangle").hide();
    cf.control().getController("Snowflake").hide();
    cf.control().getController("Tree").hide();
    cf.control().getController("Lsystem_3D").hide();
    cf.control().getController("j3lia").hide();
    cf.control().getController("M3ndelBrot").hide();
    cf.control().getController("MnndelBrot").hide();
    cf.control().getController("M2ndelBrot").hide();  
    cf.control().getController("Mandle_Music").hide();
    cf.control().getController("increase").hide();
    cf.control().getController("explorer").hide();
    cf.control().getController("add_Recursion").hide();
    cf.control().getController("Music").hide();
    cf.control().getController("add_Recursion").hide();
    cf.control().getController("Jnlia").hide();
  }
  ////play music based on which button is activated
  if (Music==true) {
    player.play();
  }
  else if (Mandle_Music==true) {
    player2.play();
  }
  else {
    player.pause();
    player2.pause();
    player.rewind();
    player2.rewind();
  }
}



void draw()

{

  console();///hide and show sliders
  f=frameRate;///frame rate is calculated in the extrenal frame
  pushMatrix();
  background(255); 
  pushStyle();
  if ((Lsystem_3D)==true && (Shapes==true)) {
    cf.control().getController("angle_Z").show();
    cf.control().getController("angle_X").show();
    cf.control().getController("angle_Y").show();
    cf.control().getController("Recursion_3D").show();
   
    /////3D L-System class execution/////
    ALSystem = new ArrayList <system> ();  
    Vec3D _length = new Vec3D(0, 0, 0);
    Vec3D Starting_disp = new Vec3D(150, 0, 0);
    LSystem = new system(_length, Starting_disp, Recursion_3D, "A");
    ALSystem.add(LSystem); 

    for (system s : ALSystem) {
      s.run();
    }
  }
  else {
    cf.control().getController("angle_Z").hide();
    cf.control().getController("angle_X").hide();
    cf.control().getController("angle_Y").hide();
    cf.control().getController("Recursion_3D").hide();
  }
  popStyle(); 
/////Fractal 2D shapes execution////
  if ((Shapes==true) && (ComplexShapes==false)) {  
    myFractal = new Fractal(add_Recursion);   
    myFractal.run(width, height);
  }

  popMatrix();
/////complex fractal shapes execution//////
  if ((Shapes==false) && (ComplexShapes==true)) { 
    myComplex_Fractal = new Complex_Fractal(w, h, xmin, ymin, xmax, ymax);
    myComplex_Fractal.mandle(w, h, xmin, ymin, xmax, ymax);
  }
}

/////////////Complex Fractal Zoom & Save Frame//////////////
void keyPressed() {
 ////R to save a picture//
  if (key=='r') {
    saveFrame();
  }
////change random seed///
  if (key=='1') {
    _seed=_seed+1;
  } 
////complex fractal zoom buttons////
  if ((key=='z') || (key=='x')) {

    window_width  =  float(mouseX)/width * w - w/2 + window_width;
    window_height =  float(height-mouseY)/height * h - h/2 + window_height;
  }
  if (key=='z') {
    w=w*0.6;
    h=h*0.6;
    
  }
  else if (key=='x') {
    w=w*1.5;
    h=h*1.5;
  }
  //////Reset the zoom/////
  else if (key=='0') {
    w=5;
    h=3; 
  }
  /////calculate zoom relative to the center of the screen////
  xmin = window_width - w/2;
  xmax = window_width + w/2;
  ymin = window_height + h/2;
  ymax = window_height - h/2;
}
/////lock buttons class////
void setLock(controlP5.Controller theController, boolean theValue) {
  theController.setLock(theValue);
  if (theValue) {
    theController.setColorBackground(color(100, 100));
  } 
  else {
    theController.setColorBackground(color(0));
  }
}



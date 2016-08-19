
//////////External Frame///////////////////////////////////////////////////////////////
public ColorPicker cp;
public ColorPicker cp2;
public ControlFrame addControlFrame(String theName, int theWidth, int theHeight, int theX, int theY) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(theX, theY);
  f.setResizable(false);
  f.setVisible(true);
  //// in order to make the external frame appear after the main window , otherwise causes nullpointer exception////
  try {
    Thread.sleep( 5 );
  } 
  catch(Exception e) {
  }

  return p;
}

public class ControlFrame extends PApplet {

  public int w, h;




  public void setup() {

//////all buttons and their specific characteristics are declared in here///////
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);       
    
    cp = cp5.addColorPicker("picker")
      .setPosition(0, 130)
        .setColorValue(color(157, 238, 232, 0));
             
    cp2 = cp5.addColorPicker("picker2")
      .setPosition(0, 220)
        .setColorValue(color(0, 0, 0, 255));
        
    cp5.addSlider("add_Recursion").plugTo(parent, "add_Recursion")
      .setPosition(330, 0)
        .setSize(30, 60)
          .setRange(1, 18).setColorValueLabel(10).setColorCaptionLabel(10)  
            .setValue(15).hide();

    cp5.addSlider("angle_Z").plugTo(parent, "angle_Z")
      .setPosition(340, 130)
        .setSize(30, 60)
          .setRange(22.5, 60).setColorValueLabel(10).setColorCaptionLabel(10)  
            .setValue(22.5).hide();
                                    
       cp5.addSlider("angle_X").plugTo(parent, "angle_X")
      .setPosition(270, 220)
        .setSize(30, 60)
          .setRange(22.5, 45).setColorValueLabel(10).setColorCaptionLabel(10)  
            .setValue(22.5).hide();
                        
      cp5.addSlider("angle_Y").plugTo(parent, "angle_Y")
      .setPosition(340, 220)
        .setSize(30, 60)
          .setRange(22.5, 55).setColorValueLabel(10).setColorCaptionLabel(10)  
            .setValue(22.5).hide();

    cp5.addSlider("increase").plugTo(parent, "increase")
      .setPosition(270, 0)
        .setSize(30, 131)
          .setRange(-100, 100)
            .setValue(22).setNumberOfTickMarks(101).setColorValueLabel(10).setCaptionLabel("n").setColorCaptionLabel(10)  
              .setSliderMode(Slider.FLEXIBLE).hide();

    cp5.addSlider("Recursion_3D").plugTo(parent, "Recursion_3D")
      .setPosition(270, 130)
        .setSize(30, 60)
          .setRange(0, 8.5).setColorValueLabel(10).setColorCaptionLabel(10)  
            .setValue(7).hide();

    cp5.addToggle("Tree").plugTo(parent, "Tree")
    .setPosition(0, 10)
    .setColorValueLabel(10)
    .setColorCaptionLabel(10).setCaptionLabel(" Fractal Tree 2D")
    .setMode(ControlP5.SWITCH).hide();
    
    cp5.addToggle("taj_mahal").plugTo(parent, "taj_mahal").setPosition(80, 10).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).hide();
    cp5.addToggle("Triangle").plugTo(parent, "Triangle").setPosition(0, 45).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" Sierpinski Triangle").hide();
    cp5.addToggle("Snowflake").plugTo(parent, "Snowflake").setPosition(0, 80).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).hide();
    cp5.addToggle("Music").plugTo(parent, "Music").setPosition(170, 0).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).hide();
    cp5.addToggle("Mandle_Music").plugTo(parent, "Mandle_Music").setPosition(170, 0).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" Canon in D").hide();
    cp5.addToggle("j3lia").plugTo(parent, "j3lia").setPosition(0, 10).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" Julia of F(z)=z^3+c").hide();
    cp5.addToggle("Lsystem_3D").plugTo(parent, "Lsystem_3D").setPosition(80, 80).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" L-System Tree 3D").hide();
    cp5.addToggle("M2ndelBrot").plugTo(parent, "M2ndelBrot").setPosition(0, 45).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" MandelBrot of F(z)=z^2+c").hide();
    cp5.addToggle("M3ndelBrot").plugTo(parent, "M3ndelBrot").setPosition(0, 80).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" MandelBrot of F(z)=z^3+c").hide();
    cp5.addToggle("MnndelBrot").plugTo(parent, "MnndelBrot").setPosition(350, 45).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" Multibrots of F(z)=z^n+c").hide();
    cp5.addToggle("Shapes").plugTo(parent, "Shapes").setPosition(0, 180).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH);
    cp5.addToggle("ComplexShapes").plugTo(parent, "ComplexShapes").setPosition(60, 180).setColorValueLabel(10).setColorCaptionLabel(10).setCaptionLabel(" Complex Shapes").setMode(ControlP5.SWITCH);
    cp5.addToggle("Jnlia").plugTo(parent, "Jnlia").setPosition(350, 90).setColorValueLabel(10).setColorCaptionLabel(10).setMode(ControlP5.SWITCH).setCaptionLabel(" Julia of F(z)=z^n+c").hide();
 
    cp5.addSlider2D("explorer")
      .setPosition(270, 150).plugTo(parent, "explorer").setColorValueLabel(10).setColorCaptionLabel(10).setCaptionLabel(" Julia c explorer").setArrayValue(new float[] {
        19, 49
      }
    )
      .setSize(150, 150).setMinX(-2.0).setMaxX(1.0).setMinY(-1.0).setMaxY(1.0).hide();
  }

  public void draw() { 
    ////background is drawn based on color picker color/////
    background(cp.getColorValue());
    //fill(0);
    //text("FPS= "+int(f),0,345);//Activate to Generate FPS 
    if (cf.control().getController("explorer").isVisible()) {
    fill(0);
    ////Show the value of c when Julia set explorer is active////////
    text("c= "+cf.control().getController("explorer").getArrayValue()[0]+" "+cf.control().getController("explorer").getArrayValue()[1]+"i",270,345);
    }
  }
  ////Adapted from Controlp5 library examples : colorpicker/////
  public void controlEvent(ControlEvent c) {
    // when a value change from a ColorPicker is received, extract the ARGB values
    // from the controller's array value
    if (c.isFrom(cp) || c.isFrom(cp2)) {
      int r = int(c.getArrayValue(0));
      int g = int(c.getArrayValue(1));
      int b = int(c.getArrayValue(2));
      int a = int(c.getArrayValue(3));
      color col = color(r, g, b, a);
      println("event\talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
    }
  }

  public void picker(int col) {
    println("picker\talpha:"+alpha(col)+"\tred:"+red(col)+"\tgreen:"+green(col)+"\tblue:"+blue(col)+"\tcol"+col);
  }

 ////Adapted from Controlp5 library examples: frame/////
  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w =  theWidth;
    h = theHeight;
  }


  public ControlP5 control() {
    return this.cp5;
  }


  ControlP5 cp5;

  Object parent;
}


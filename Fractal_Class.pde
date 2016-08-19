public class Fractal {



///////////Global Variables/////////////////////////////////////////////////////////////////////////////

///////////////////Tree_variables/////////////////////////////////////////////////////////////////////////////////
  public int leaves;
  public float angle = 20;
  public float treeSize = 200;
  public float add_Recursion;
  public color trunk = #8b4513;

////////////////Triangle_variables///////////////////////////////////////////////////////////////////////////////
  public float  point_x0;
  public float  point_y0;
  public float  point_x1; 
  public float  point_y1; 
  public float  point_x2; 
  public float  point_y2; 
  public float height_tri = sqrt(3)/2; //height of equilateral triangle
  public int depth;
  public float triangleSize = 650;
  public float triangle_recc;
////////////////Snow_Flake_variables /////////////////////////////////////////////////////////////////////////////  
  public color snow=#EAB4C3;
  public float flake_recc;
 
 


//////taj-mahal_variables/////////
float taz_mahal_recc;




////////////////Constructor_of the class////////////////////////////////////////////////////////////////////////////
  public Fractal (float _add_Recursion) {

    add_Recursion=_add_Recursion;
    ///////////Different exit Conditions based on the value of the Controller/////////////////////////
    taz_mahal_recc= 300-add_Recursion*16.5;
    triangle_recc=add_Recursion/120;
    flake_recc= 40/(add_Recursion*0.58);
  }

////////////////functions/////////////////////////////////////////////////////////////////////////////  
  public void run (float x, float y) {

    c2 = cp.getColorValue();///first color picker///
    randomSeed(_seed);
 ///based on buttons every time another shape is executed and at the same time prevents (locks),the others////
    if (Tree==true){
      drawTree(x/2, y);
    setLock(cf.control().getController("taj_mahal"), true);
    setLock(cf.control().getController("Triangle"), true);
    setLock(cf.control().getController("Snowflake"), true);
    setLock(cf.control().getController("Lsystem_3D"), true);
    }
    
    else if (Triangle==true) {
      drawSierpink(x/2, y); 
    setLock(cf.control().getController("Tree"), true);
    setLock(cf.control().getController("taj_mahal"), true);
    setLock(cf.control().getController("Snowflake"), true);
    setLock(cf.control().getController("Lsystem_3D"), true);
    }
    

    else if (Snowflake==true) {
      drawSnowFlake(x/2, y/2);
    setLock(cf.control().getController("Tree"), true);
    setLock(cf.control().getController("taj_mahal"), true);
    setLock(cf.control().getController("Triangle"), true);
    setLock(cf.control().getController("Lsystem_3D"), true);
    }

   else if (taj_mahal==true) { 
      tazmahal(x, x);
    setLock(cf.control().getController("Tree"), true);
    setLock(cf.control().getController("Triangle"), true);
    setLock(cf.control().getController("Snowflake"), true);
    setLock(cf.control().getController("Lsystem_3D"), true);
    }
    
    else if (Lsystem_3D==true) {

    setLock(cf.control().getController("Tree"), true);
    setLock(cf.control().getController("taj_mahal"), true);
    setLock(cf.control().getController("Triangle"), true);
    setLock(cf.control().getController("Snowflake"), true);
  }
    
  else {
    
    setLock(cf.control().getController("Tree"), false);
    setLock(cf.control().getController("taj_mahal"), false);
    setLock(cf.control().getController("Triangle"), false);
    setLock(cf.control().getController("Snowflake"), false);
    setLock(cf.control().getController("Lsystem_3D"), false);
  }
    
  }



  public void tazmahal (float x, float y )
  {
    pushStyle();
    background(255); 
    taj_mahal(x/2, y/2);
    popStyle();
  }

  public void drawTree(float x, float y)
  {    

    pushStyle();
    background(255);
    translate(x, y);    
    drawBranch(1);   
    popStyle();
  }


  public void drawSierpink(float x, float y)
  {

    pushStyle();
    background(255);
    drawSierpinski(x, y * (1/sqrt(3)/height_tri), triangleSize);
    popStyle();
    ;
  }


  void drawSnowFlake(float x, float y) { 

    pushStyle();
    background(255);
    Snow_Flake(x, y, 300, 10);
    popStyle();
  }


  void taj_mahal(float x,float y) {
    if (y < taz_mahal_recc) { 
      return;
    }
    pushMatrix();
    translate(y/2,x);
    stroke(color(random(255), random(255), random(255)));
    fill(color(random(255), random(255), random(255)));
    ellipse(y/2,y/2, y, y);
    taj_mahal(y/2, y/2);
    taj_mahal(0,y/2);
    taj_mahal(-y/2,y/2);
    popMatrix();
  }

  void drawSierpinski(float  point_x, float  point_y, float  tri_size) {
    if (1/tri_size > triangle_recc) {  
    //////Draw only the outer terminal triangles/////////////
      drawTriangle(point_x, point_y, tri_size);     
    }
    else { 
    /////Calculate all the upside down triangles////////////      
      float point_x0 = point_x;
      float point_y0 = point_y - sqrt(3)/6 * tri_size;
      float point_x1 = point_x - tri_size/4;
      float point_y1 = point_y + (sqrt(3)/6/2) * tri_size;
      float point_x2 = point_x + tri_size/4;
      float point_y2 = point_y + (sqrt(3)/6/2) * tri_size; 
      ///random colouring based on recursion      
      stroke(lerpColor(color(random(255), random(255), random(255)), c2, tri_size/add_Recursion));
      drawSierpinski(point_x0, point_y0, tri_size/2);      
      fill(color(random(255), random(255), random(255)));        
      drawSierpinski(point_x1, point_y1, tri_size/2);     
      fill(color(random(255), random(255), random(255)));         
      drawSierpinski(point_x2, point_y2, tri_size/2);
    }
  }

  void Snow_Flake(float x, float y, float p, int times) {
    
    ///random colouring based on recursion
    stroke(lerpColor(color(random(255), random(255), random(255)), c2, times/add_Recursion));  
    line(x,y,x,y+p); 
    line(x,y,x+p,y-p/2);
    line(x,y,x-p,y-p/2);         
    if (times>flake_recc) {
      p=p*-1/2;
      strokeWeight(0.25*times);    
      Snow_Flake(x, y+p, p, times-1);      
      Snow_Flake(x+p, y-p/2, p, times-1);
      Snow_Flake(x-p, y-p/2, p, times-1);
    }
    
    
  }

////calcualte the midpoints of each side of the equilater triangle//////
  void drawTriangle(float  point_x, float  point_y, float  tri_size) {
  
    point_x0 = point_x;
    point_y0 = point_y - 1/sqrt(3) * tri_size;
    point_x1 = point_x - tri_size/2;   
    point_y1 = point_y + sqrt(3)/6 * tri_size;
    point_x2 = point_x + tri_size/2;
    point_y2 = point_y + sqrt(3)/6 * tri_size; 
    triangle(point_x0, point_y0, point_x1, point_y1, point_x2, point_y2);
    
     
    
  } 
  
  
  public void drawBranch(int level)
  {

    float part;
    float Treeangle;
    
    if (level >add_Recursion) 
      return;   
    part = -treeSize * pow(0.8 +random(0.04) - 0.04, level); 
   ////thinner lines as recursion goes on 
    strokeWeight(0.085 * -(part));
    ///Progressive colouring based on recursion
    stroke(lerpColor(trunk, leaves, level/add_Recursion)); 
    leaves = lerpColor(trunk, c2, n);    
    n += (1-n)* 0.1;   
    line(0, 0, 0, part);
    translate(0, part);
    ///Random Angle of 50 minus 25   
    Treeangle = angle +random(50.0) - 25;
    rotate(radians(-Treeangle));
    drawBranch(level + 1);
    rotate(radians(Treeangle));
    Treeangle = angle + random(50.0) - 25;
    rotate(radians(Treeangle));
    drawBranch(level + 1);
    rotate(radians(-Treeangle));
    translate(0, -part);
  }
}


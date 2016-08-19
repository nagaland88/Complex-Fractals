public class Complex_Fractal {

  //Global Variables


  //Constructor
  public Complex_Fractal (double _w, double _h, double _xmin, double _ymin, double _xmax, double _ymax) {

    double w=_w;
    double h=_h;
    double xmin=_xmin;
    double ymin=_ymin;
    double xmax=_xmax;
    double ymax=_ymax;
  }

  ///function

  public void mandle(double w, double h, double xmin, double ymin, double xmax, double ymax) {

    c2 = cp.getColorValue();///first color picker 
    c3 = cp2.getColorValue();///second color picker
    float X=cf.control().getController("explorer").getArrayValue()[0];///Julia set explorer X coordinate
    float Y=cf.control().getController("explorer").getArrayValue()[1];////Julia set explorer Y coordinate 
    int iterations = 150; ///number of maximum iterations///    
    double a;
    double b;
    double aa;
    double bb;  
    double aaa;
    double twoab;
    double bbb;  
    double dimension;
    double theta;
    ////uncomment this for binomial theorem for f(z)=z^4+c
    //double aaaa;
    //double bbbb;
    //double fouraaab;
    //double fourbbba;
    //double sixaabb;
    color black=color(c3);
    float r =cp.getArrayValue(0);
    float g =cp.getArrayValue(1);
    float bl =cp.getArrayValue(2);  

    // Calculate amount we increment x,y for each pixel
    double dx = (xmax - xmin) / (width);
    double dy = (ymax - ymin) / (height);
    // Start y
    double y = ymin;
    double x;
    int j;
    int i;
    int n;
    int infinity=25;///after this number we assume number goes off to infinity
    /////Algorithm starts with Julia Set of f(z)=z^2+c/////
    loadPixels(); 
    for (j = 0; j < height; j++) {
      // Start x
      x = xmin;
      for (i = 0;  i < width; i++) {

        a = x;
        b = y;

        n=0;
      
        while (n < iterations) {

          aa = a*a;
          bb = b * b;
          twoab = 2.0 * a * b;          
          aaa= aa*a;
          bbb=bb*b;
          //aaaa=aa*aa;
          //bbbb=bb*bb;
          //fouraaab=4*aaa*b;
          //fourbbba=4*bbb*a;
          //sixaabb=6*aa*bb;
                              
         /////De Moivre's theorem for n>3 or n<0////
          if ((MnndelBrot==true) || (Jnlia==true)){
            dimension  =Math.sqrt(aa+bb);
            theta =0;
            dimension=Math.pow(dimension, increase);
            if (a>0) {
              theta=Math.atan(b/a);
            }
            else if (a<0)
            {
              theta=Math.atan(b/a);
              theta=theta + radians(360);
            }
            else {
              theta=0;
            }
            theta=increase*theta;
            if(MnndelBrot==true) {
            a=dimension*Math.cos(theta)+x;
            b=dimension*Math.sin(theta)+y;
            }
            else if (Jnlia==true){
            a=dimension*Math.cos(theta)+X;
            b=dimension*Math.sin(theta)+Y;
            }
          } 
          ///trying f(z)=z^4

          //a = aaaa + bbbb-(sixaabb)+x;
          //b = 4*(aaa*b - a*bbb)+y;
          ///Multibrot and Julia of n=3
          else if (M3ndelBrot==true) {
            ///f(z)=z^3
            a = aaa-3*a*bb+x;
            b = 3*aa*b-bbb+y;
            //a= Math.exp(a)*Math.cos(b)+0.04;
            //b= Math.exp(a)*Math.sin(b);
          }
          else if (j3lia==true) {
            a = aaa-3*a*bb+X;
            b = 3*aa*b-bbb+Y;
          } 

          else if (M2ndelBrot==true) {
            a = aa - bb +x;
            b = twoab +y;
         
          }

          else {
            a = aa - bb +X;
            b = twoab +Y;
            
           /// uncomment for faster f(z)=z^4

          //a = aaaa + bbbb-sixaabb+X;
          //b = fouraaab - fourbbba+Y;
          }    
          if (aa+bb > infinity) {
            break;
          }
          n++;
        }
        ///Normal colouring , as the number stays bounded is black , else is painted RGB based on how fast the number escalated up to infinity///
        if (n == iterations) {         
          pixels[i+j*width] = black;
        }
        else {

          pixels[i+j*width] = color(n*25 % r, g, bl);
        }
        /////Reversed colouring for n<0////
        if (((MnndelBrot==true) || (Jnlia==true))  && (increase<0)) {
          if (n== iterations) { 
            pixels[i+j*width] = color(n*25 % r, g, bl);
            
          }

          else {
            pixels[i+j*width] = black;
          }
        }
        x += dx;
      }
      y += dy;
    }
    updatePixels();
  }
}





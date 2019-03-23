/*
  QS的子类
 A号病毒
 */


class GmA extends QS {
  int a, b;          //初始随机目标值
  //PImage img2;


  GmA(int wid, int gl, int d_) {
    super(wid, gl, d_);
    
      
    a = int(random(1, w-1));
    //a = w-1;
    b = int(random(1, h-1));
    pix[a][b] = 1;
    Gen = 1;
    disGR(a, b);
  }
  void germ() {
    //a = int(random(1, w-1));
    ////a = w-1;
    //b = int(random(1, h-1));
    //pix[a][b] = 1;
    //Gen = 1;
    //disGR(a, b);
    
     //int t =0;
     //if(Gen <= genLimit){
     //  gmA.getArr();
     //for (int i =1; i <w-1; i ++)
     // {
     //   for (int j =1; j <h-1; j ++)
     //   {
     //     if(pix[i][j]==d && t ==0 && random(2.0)<0.5){
     //     pix[i][j] = d+1;
     //     }
     //   }
     // }
     //}
     
     
    for (int i =1; i <w-1; i ++)
    {
      for (int j =1; j <h-1; j ++)
      {
        next(i, j);
        if (GRate ==0.7 ) { //<>//
          //trigger();
          getArr();
          
        }
        if (GRate==1) {
          println("is dead!");
          break;
        }
      }
    }
  }

  void disGR(int x, int y) {
    //color c =img2.get(x,y);
    //colorMode(HSB);
    color c = color(0,30);

    //pix[a][b] = 1;
    //color c = color(25, random(255), random(255), 200);
    fill(c);
    stroke(c);
    rect(x*wid, y*wid, wid, wid);
    //img.set(x*wid, y*wid, c);
    //image(img2,0,0,width,height);
  }

  void getArr() {
    for (int i =1; i <w-1; i ++)
    {
      for (int j =1; j <h-1; j ++)
      {
        gmB.pix[i][j] = pix[i][j];
      }
    }
  }
}

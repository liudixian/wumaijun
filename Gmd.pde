/*
  CS的子类
 C号病毒
 */



class GmD extends QS {
  int a, b;          //初始随机目标值


  GmD(int wid, int gl, int d_) {
    super(wid, gl, d_);
    //a = int(random(1, w-1));
    //  //a = w-1;
    //  b = int(random(1, h-1));
    //  pix[a][b] = 3;
    Gen = 1;
    a =0;
    //disGR(a,b);
  }

  void disGR(int x, int y) {
    color c = color(255);

    //c = color(255);

    //pix[a][b] = 1;
    //color c = color(25, random(255), random(255), 200);
    fill(c);
    stroke(c);
    ellipse(x*wid, y*wid, wid, wid);
    a++;
    println(Gen, x, y);
  }
  
  
  void germ() {
    //a = int(random(1, w-1));
    //  //a = w-1;
    //  b = int(random(1, h-1));
    //  pix[a][b] = 3;
    //  disGR(a, b);
    //  Gen ++;
    if (Gen <genLimit )
    { 
      //a = int(random(1, w-1));
      ////a = w-1;
      //b = int(random(1, h-1));
      //pix[a][b] = 2;
      //disGR(a, b);
      //Gen ++;
      for (int i =1; i <w-1; i ++)
      {
        for (int j =1; j <h-1; j ++)
        {
          next(i, j);

          if (GRate==1) {
            //print("A is DeaD!");
            dead = true;
            break;
          }
        }
      }
    }
  }


  void next(int i, int j) {

    if (Gen <genLimit )
    {


      int a_ = int(random(-2, 2));
      int b_ = int(random(-2, 2)); 
      int i_ = 0;
      int j_ = 0;
      i_ = i;
      j_ = j;
      i_ +=a_;
      j_ += b_;
      if (pix[i][j] == nextD) {
        if (a_==0 && b_ ==0)
        {
          pix[i][j]=nextD;
        } else  if ( pix[i_][j_] == d)
        {


          pix[i_][j_] =nextD;
          disGR(i_, j_);
          Gen +=1;
          GRate = Gen/genLimit;
          //println(Gen,genLimit,GRate);
          //trigger();
        }
      }
    }
  }

  void getArr() {
    for (int i =1; i <w-1; i ++)
    {
      for (int j =1; j <h-1; j ++)
      {
        gmD.pix[i][j] = pix[i][j];
      }
    }
  }
  
  boolean isFinished(){
      if(Gen == genLimit)  {
      dead = true;
      }
      return dead;
  }
}

class QS {
  int [][] pix;    //目标数列
  int w, h, wid;     //目标宽w和目标高h，单位间距wid
  //int a, b;          //初始随机目标值
  float Gen, genLimit;  //动态生成数目Gen，生成总数genLimit
  float GRate;       //已生成的比例
  int d, nextD;   //侵蚀等级与下一级
  boolean dead;
  int a;
  int n;


  //病毒构造函数
  QS(int wid_, int gl, int d_)
  {
    wid = wid_;
    w = width/wid;
    h = height/wid;
    pix = new int[w][h];
    d = d_;
    nextD = d_+1;
    n = 0;  //kaiguan
    a=0;
    dead = false;
    //a = int(random(1, w-1));
    ////a = w-1;
    //b = int(random(1, h-1));
    //pix[a][b] = 1;
    Gen = 1;
    //rect(a*wid, b*wid, wid, wid);
    genLimit = gl;
    GRate = Gen/genLimit;
    //print(GRate);
  }



  //负责生成targ数列
  void germ() {
    for (int i =1; i <w-1; i ++)
    {
      for (int j =1; j <h-1; j ++)
      {
        next(i, j);

        if (GRate==1) {
          print("is DeaD!");
          break;
        }
      }
    }
  }

  //检查targ数列，display侵蚀图像
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
        } else  if (pix[i_][j_] == d)
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

  //

  void disGR(int x, int y) {
    color c = color(255);

    c = color(255, 200);

    //pix[a][b] = 1;
    //color c = color(25, random(255), random(255), 200);
    fill(c);
    stroke(c);
    rect(x*wid, y*wid, wid, wid);
  }

  boolean isDead() {
    return dead;
  }



  //触发函数
  void trigger() {
    if (!(GRate <0.7)) {


      for (int i =1; i <w-1; i ++)
      {
        for (int j =1; j <h-1; j ++)
        {

          a = pix[i][j];
          switch(n)
          {
          case 0:
            if (a ==nextD)
            {
              if (random(100)<40)
              {
                pix[i][j] =nextD+1;    //deg为1的域里面每个点有1/2的机率设置成为2，并触发下一个Gm 
                gmB.disGR(i, j);
                n =1;               //当出现一个初始值时跳出
                print("goNext!", i, j);
                break;
              }
            }
          }
        }
      }
    }
  }
}

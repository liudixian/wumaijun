/* //<>// //<>//
  此程序将csv的数据转化成图片像素数的个数，
 并由QS(侵蚀)类执行绘画，制造一种有点到面慢慢蔓延开来的"侵蚀"效果。
 */


PImage img;
String[] PM25;   //pm2.5数据数组
Chek ck; //抓取数据的对象
GmA gmA;
GmB gmB;
GmC gmC;
GmD gmD;
int deg;    //污染等级
int time;   //时间
int scope;  //作用域
int totalPix;
float d1, d2, d3, d4, D1, D2, D3, D4;  //个等级的数量
int total;   //总天数


int window_w = 1080;
int window_h = 720;

void setting() {

  //size(img.width, img.height);
}

void setup() {
  size(2354, 383);
  //fullScreen();
  background(0);
  deg =1;
  img = loadImage("zf.jpg");
  img.resize(width, height);

  ck = new Chek();
  PM25 = loadStrings("Beijing_2016_HourlyPM25_created20170201.csv"); 
  for (int i =0; i <PM25.length; i ++) {
    ck.caluDATA();
    //degree = ck.getDATA('d');
    time = ck.getDATA('t');
    d1 = ck.getGe(1);      //gen = ck.d1
    d2 = ck.getGe(2);
    d3 = ck.getGe(3);
    d4 = ck.getGe(4);
    total = ck.total;
    //scope = ck.getDATA('s');
  }
  D1 = d1+d2+d3+d4;
  D2 = d2+d3+d4;
  D3 = d3+d4;
  D4 = d4;

  gmA = new GmA(1, 436000, 0);
  gmB = new GmB(1, 117000, 1);
  gmC = new GmC(1, 33300, 2);
  gmD = new GmD(1, 1920, 3);

  //frameRate(50);
  image(img, 0, 0);
}

void draw() {

  //println(D(D1), D(D2), D(D3), D(D4));

  if (gmA.Gen<gmA.genLimit) {
    int a, b;
    a = int(random(1, gmA.w-1));
    //a = w-1;
    b = int(random(1, gmA.h-1));
    gmA.pix[a][b] = 1;
    gmA.Gen += 1;
    gmA.disGR(a, b);
  }

  gmA.germ();


  if (gmA.GRate>=0.7 && gmB.Gen<=gmB.genLimit) {
    int a, b;
    a = int(random(1, gmB.w-1));
    //a = w-1;
    b = int(random(1, gmB.h-1));
    if (gmB.pix[a][b]==gmB.d) {
      gmB.pix[a][b] = 2;
      gmB.Gen += 1;
      gmB.disGR(a, b);
    }
    gmB.germ();
  }



  //for (int i =1; i <gmA.w-1; i ++)
  //{
  //  for (int j =1; j <gmA.h-1; j ++)
  //  {
  if (gmB.GRate>=0.7 && gmC.Gen<=gmC.genLimit ) {
    int a, b;
    a = int(random(1, gmC.w-1));
    //a = w-1;
    b = int(random(1, gmC.h-1));
    if (gmC.pix[a][b]==gmC.d) {
      gmC.pix[a][b] = 3;
      gmC.Gen += 1;
      gmC.disGR(a, b);
      //break;
      //}
      //}
    }
    gmC.germ();
  }

  if (gmC.GRate>=0.7 && gmD.Gen<=gmD.genLimit ) {
    int a, b;
    a = int(random(1, gmD.w-1));
    //a = w-1;
    b = int(random(1, gmD.h-1));
    if (gmD.pix[a][b]==gmD.d) {
      gmD.pix[a][b] = 4;
      gmD.Gen += 1;
      gmD.disGR(a, b);
      //break;
      //}
      //}
    }
    gmD.germ();
    if (gmD.isFinished()) {
      println("D-finished!");
    }
  }

  //}


  saveFrame("./output/wumai_###.jpg");                //存入帧（有序号的图片）
}


int D(float d_) {
  int to = PM25.length;
  d_ = width*height*(d_/to);
  return int(d_);
}

void mousePressed() {
  saveFrame("../wumai_######,jpg");
  exit();
}

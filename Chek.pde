/*
  检查并输出数列
  
*/

class Chek {
  int scope;    //细菌体的作用域（范围）
  int t;        
  int deg;
  String [] PM25;
  int index;
  int ge;
  int d1, d2, d3, d4,total;        //四个等级的累加数和总污染小时数

  Chek() {
    deg = 0;
    PM25 = loadStrings("Beijing_2016_HourlyPM25_created20170201.csv"); 

  
  }
  
  void caluDATA(){
    if(index <=PM25.length){
    //for (int index =0; index <PM25.length; index ++){
        String[] wumai = split(PM25[index], ',');
    if (wumai.length ==11 && index > 2) 
    {
      //pm2.5指数
      int zs = int(wumai[7]);
      //println(index,wumai[7]);
      //时间（月份）
      t   = int( wumai[6]);
      //污染等级和小时数
        scope = width;
       if (zs >= 55 && zs <=150) 
        {  
          deg =1;
          d1 ++;
        } else if (zs >= 150 && zs <=250)
        {  
          deg = 2;
          d2 ++;
        } else if (zs >= 250 && zs <=500)
        {
          deg = 3;
          d3++;
        } else if (zs>500)
        {
          deg =4;
          d4++;
        }
        //println(zs);
        total = d1+d2+d3+d4;
    }
    //println("d1:",d1," ","d2:",d2,"d3:",d3,"d4:",d4,total,"t:",t,"scope:",scope);

   index ++;
  }
  }
  
 
  
  int getGe(int a){
    if(a ==1)
    {
      ge = d1;
    }else if(a == 2)
    {
      ge = d2;
    }else if(a ==3)
    {
      ge = d3;
    }else if(a ==4)
    {
      ge = d4;
    }
    return ge;
  
  }


  int getDATA(char A){
    int a=0;
    if(A == 't' )
    {
      a = t;
    }else if(A =='d')
    {
      a = deg;
    }else if (A =='s')
    {
      a = scope;
    }
  return a;
  }
  
  
}
bool zeroCheck(int a){
  if(a <= 0){
    return true;
  }else{
    return false;
  }
}

String ageCheck(String nom,int age){
  if(age >= 18){
    return "Adulte";
  }else{
    return "Mineur";
  }
}

int nbrPattes(int poules,int vaches,int chevaux){
  return (poules * 2)+(vaches *4)+(chevaux*4);
}

bool divCheck(int n){
  if(n % 2 == 0 || n % 3 == 0){
    return true;
  }else{
  return false;
  }
}

bool estNombrePremier(int nombre) {
  if (nombre < 2) return false;
  for (int i = 2; i <= nombre; i++) {
    if (nombre % i == 0) return false;
  }
  return true;
}

double surfaceTriangle(double b,double h){
  return (b * h) / 2;
}

double conversionDhEuro(double m){
  return m/10;
}

double conversionDevise(double m,String d){
  switch(d){
    case "livre":
      return m * 0.082;
    case "euro":
      return m * 0.096;
    case "dollar":
      return m * 0.11;
    default :
      return -1;
  }
}

void main() {
  print(zeroCheck(0));
  print(ageCheck("Anass",21));
  print(nbrPattes(2,1,1));
  print(divCheck(55));
  print(estNombrePremier(7));
  print(surfaceTriangle(5,12));
  print(conversionDhEuro(20));
  print(conversionDevise(1,"livre"));
}
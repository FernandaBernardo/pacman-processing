abstract class Level {
  ArrayList <Barreira> barreiras;

  Level () {
    barreiras = new ArrayList();  
  }
  
  void desenha (){
    for (Barreira b : barreiras) b.desenha();
  }
}

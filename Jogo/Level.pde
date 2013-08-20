abstract class Level {
  ArrayList <Barreira> barreiras;
  ArrayList <Energia> energias;
  ArrayList <Ponto> pontos;

  Level () {
    barreiras = new ArrayList();
    energias = new ArrayList();
    pontos = new ArrayList();
  }

  void desenha () {
    for (Sprite b : barreiras) b.desenha();
    for (Sprite b : energias) b.desenha();
    for (Sprite b : pontos) b.desenha();
  }
}


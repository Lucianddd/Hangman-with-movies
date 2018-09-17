public class Rocket  {
   public static int weight;

    boolean launch(){
        return true;
    }

    boolean land(){
        return true;
    }

  public static boolean canCarry(Item item) {
      if (Rocket.weight - item.weight > 0)
          return true;
      else
          return false;
  }

  public static void carry (Item item){
          Rocket.weight=Rocket.weight-item.weight;
      }
      void print(Rocket rocka){
        System.out.println(Rocket.weight);
      }

}

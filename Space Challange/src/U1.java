import java.math.BigDecimal;
import java.util.Random;

public class U1 extends Rocket{
    int weight;
  U1(){
      weight=8000;
  }
    public static boolean canCarry(Item item,U1 rock) {
        if (rock.weight - item.weight >= 0)
            return true;
        else
            return false;
    }

    public static void carry (Item item,U1 rock){
        rock.weight=rock.weight-item.weight;
    }

   public  static boolean launch(U1 rock){
        double chance;
        int realweight=8000-rock.weight;
        Random ran=new Random();
        chance=(4/100.0)*(realweight/8.0);
        int ch=(int) chance;
        int nr=ran.nextInt(1000);
        System.out.print("This rocket have "+ch+"/1000 to crash at launching ");
        if(nr<chance)
            return false;
        else
            return true;

    }
    public  static boolean land(U1 rock){
        double chance;
        int realweight=8000-rock.weight;
        Random ran=new Random();
        chance=(1/100.0)*(realweight/8.0);
        int ch=(int)chance;
        int nr=ran.nextInt(1000);
        System.out.print("and "+ch+"/1000 to crash at landing.  ");
        if(nr<chance)
            return false;
        else
            return true;
    }
}

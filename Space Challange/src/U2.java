import java.util.Random;

public class U2 extends Rocket {
    int weight;

    U2(){
        weight=11000;
    }

    public static boolean canCarry(Item item,U2 rock) {
        if (rock.weight - item.weight >= 0)
            return true;
        else
            return false;
    }

    public static void carry (Item item,U2 rock){
        rock.weight=rock.weight-item.weight;
    }

    public  static boolean launch(U2 rock){
        double chance;
        int realweight=11000-rock.weight;
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

    public  static boolean land(U2 rock){
        double chance;
        int realweight=11000-rock.weight;
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

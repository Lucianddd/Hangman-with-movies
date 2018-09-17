import java.awt.datatransfer.SystemFlavorMap;
import java.io.File;
import java.util.*;
import java.io.*;
public class Simulation {
    static int TotalBugetU1=0,TotalBugetU2=0,c1=0,c2=0;
    static String[] list = new String[200];
    static Item[] items = new Item[200];
   static int num,k=0,l=0;
    static U1[] RocketType1 = new U1[20];
    static U2[] RocketType2 = new U2[20];
    public static void loadItems() {

        int count = 0;

        try {
            File file = new File("C:\\Users\\Lucia\\Downloads\\ud282-master (1)\\ud282-master\\Space Challange\\src\\tools");
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                list[count++] = scan.nextLine();
                list[count - 1] = list[count - 1].replaceAll("[a-z= ]", "");
                items[count - 1] = new Item();
                items[count - 1].weight = Integer.parseInt(list[count - 1]);
            }
        } catch (FileNotFoundException er) {
            System.out.println(er);
        }
        String[] words = new String[200];

        list[0] = list[0].replaceAll("[a-z= ]", "");num=count;
    }
    public static void loadInhabitans() {

        int count = 0;

        try {
            File file = new File("C:\\Users\\Lucia\\Downloads\\ud282-master (1)\\ud282-master\\Space Challange\\src\\inhabitans");
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                list[count++] = scan.nextLine();
                list[count - 1] = list[count - 1].replaceAll("[a-z= ]", "");
                items[count - 1] = new Item();
                items[count - 1].weight = Integer.parseInt(list[count - 1]);
            }
        } catch (FileNotFoundException er) {
            System.out.println(er);
        }
        String[] words = new String[200];

        list[0] = list[0].replaceAll("[a-z= ]", "");num=count;
    }

    public static void loadU1() {
        k=0;
        boolean ok = true;
                while (ok) {
            ok=false;RocketType1[k]=new U1();
            for (int i = 0; i < num; i++) {
                if (U1.canCarry(items[i], RocketType1[k])) {
                        U1.carry(items[i], RocketType1[k]);
                        items[i].weight = 0;
                }
                if (items[i].weight != 0)
                    ok = true;
            }
            k++;
        }
    }
    public static void loadU2() {
        l=0;
        boolean ok = true;
        while (ok) {
            ok = false;
            RocketType2[l] = new U2();
            for (int i = 0; i < num; i++) {
                if (U2.canCarry(items[i], RocketType2[l])) {
                    U2.carry(items[i], RocketType2[l]);
                    items[i].weight = 0;
                }
                if (items[i].weight != 0)
                    ok = true;
            }
            l++;
        }
    }
    static void runSimulation1(){
        int budget=0;

        for(int i=0;i<k;i++) {
            if (U1.launch(RocketType1[i])) {
                if(U1.land(RocketType1[i])) {
                    System.out.println("Rocket type U1 number (" + i + ") was successfully launched and landed on Mars.");
                    budget=budget+100;
                }
                else{
                    System.out.println("Rocket type U1 number (" + i + ") was successfully launched but it crashed at landing. Reloading rocket number (" + i + ").");
                    budget=budget+100;
                    i--;c1++;
                }
            }
            else{
                System.out.println("Rocket type I number ("+i+") crashed at launching. Reloading rocket number ("+i+").");
                i--;c1++;
                budget=budget+100;
            }

        }


        System.out.println("Total buget for thi phase using rocket type U1 is : $" + budget+" Million ");
        TotalBugetU1=TotalBugetU1+budget;
        Arrays.fill(items,null);
        Arrays.fill(list,null);
        System.out.println();

        }
    static void runSimulation2(){
        int budget=0;

        for(int i=0;i<l;i++) {
            if (U2.launch(RocketType2[i])) {
                if(U2.land(RocketType2[i])) {
                    System.out.println("Rocket type U2 number (" + i + ") was successfully launched and landed on Mars.");
                    budget=budget+130;
                }
                else{
                    System.out.println("Rocket type U2 number (" + i + ") was successfully launched but it crashed at landing. Reloading rocket number (" + i + ").");
                    budget=budget+130;
                    i--;c2++;
                }
            }
            else{
                System.out.println("Rocket type U2 number ("+i+") crashed at launching. Reloading rocket number ("+i+").");
                i--;c2++;
                budget=budget+130;
            }

        }


        System.out.println("Total buget for this phase using rocket type U2 is : $" + budget+" Million ");
        TotalBugetU2=TotalBugetU2+budget;
        Arrays.fill(items,null);
        Arrays.fill(list,null);
        System.out.println();

    }

 public static void statistics(){
        System.out.println("Buget total rachete U1 is: $"+TotalBugetU1+"Million  ("+c1+" rockets crashed)");
        System.out.println("Buget total rachete U1 is: $"+TotalBugetU2+"Million  ("+c2+" rockets crashed)");
System.out.println();
System.out.println("In the end I'll tell you only this.");
if(TotalBugetU2==TotalBugetU1)
    System.out.println("I'll let you choose the rochet this time but dont think too hard because both cost the same. :)");
else
if(TotalBugetU1<TotalBugetU2)
            System.out.println("Use rocket type U1 my priend");
                else
            System.out.println("Use rocket type U2 my priend");
    }
}


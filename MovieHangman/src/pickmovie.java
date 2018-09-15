import java.io.File;
import java.io.FileNotFoundException;
import java.util.Random;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class pickmovie {
    String[] list=new String[200],hiddenword=new String[200];
    String[] word=new String[200];
    String[] wrongletter=new String[200];
    int wrongguess=0;

    int count=0;int nr,k=0;int j;
    void createarray(){

        try {
            File file=new File("C:\\Users\\Lucia\\Downloads\\ud282-master (1)\\ud282-master\\MovieHangman\\src\\movies.txt");
            Scanner scan=new Scanner(file);
            while (scan.hasNextLine()) {
                list[count++] = scan.nextLine();
            }
            }catch(FileNotFoundException er){
                System.out.println(er);
        }
        }

      void pickran(){

        Random ran=new Random();
           nr=ran.nextInt(count-1);
         word=list[nr].split("");
          int in = 0,i;
          char v='a';

        for(i=0;i<list[nr].length();i++) {
            v = word[i].charAt(0);
            in = v;

            if (in > 96 && in < 123)
                hiddenword[i] = "_";
            else
                hiddenword[i] = " ";
        }

          for( i=0;i<list[nr].length();i++)
              System.out.print(hiddenword[i]);
          System.out.println("");
          System.out.println("You have guessed (0) wrong letters:");
    }

    void guess(){

        int i;boolean ok=false,win=false,let=true;


        Scanner scan=new Scanner(System.in);
        System.out.print("Guess a letter:");
        char letter=scan.next().charAt(0);
            for(i=0;i<k;i++)
                if(letter==wrongletter[i].charAt(0))
                    let=false;
        if (let == true) {

        for(i=0;i<list[nr].length();i++)
            if(letter==word[i].charAt(0)) {
                hiddenword[i] = String.valueOf(letter);
             ok=true;
            }
            if(ok==false)
            {
                wrongguess++;
                wrongletter[k]=String.valueOf(letter);
                k++;
            }
            for(i=0;i<list[nr].length();i++)
                if(hiddenword[i]==String.valueOf("_"))
                    win=true;
                if(win==false) {
                    System.out.println("YOU WOOOOOOOON");
                    System.exit(0);
                }

        System.out.print("You are guessing:");
            for( i=0;i<list[nr].length();i++)
            System.out.print(hiddenword[i]);
            System.out.println("");
            System.out.print("You have guessed ("+wrongguess+ ") wrong letters:");

            while(j<k) {
                System.out.print(wrongletter[j]+" ");
                j++;
            }
            j=0;
            System.out.println();System.out.println();
    }
    else
        System.out.println("This letter was already introduced ");

    }

}


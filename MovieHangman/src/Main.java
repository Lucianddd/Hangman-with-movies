public class Main {

    public static void main(String [] args){
System.out.print("You are guessing:");
    pickmovie start=new pickmovie();
    start.createarray();
    start.pickran();
    start.guess();

    guess star=new guess();
   while(start.wrongguess!=10){
   start.guess();
   }
   System.out.println("YOU LOST");
    }
}

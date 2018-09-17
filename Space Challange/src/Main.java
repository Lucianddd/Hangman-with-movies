public class Main {
    public static void main(String [] args){

        Simulation.loadItems();
        Simulation.loadU1();
        Simulation.runSimulation1();
        Simulation.loadInhabitans();
        Simulation.loadU1();
        Simulation.runSimulation1();
        System.out.println();
        System.out.println();
        System.out.println();

        Simulation.loadItems();
        Simulation.loadU2();
        Simulation.runSimulation2();
        Simulation.loadInhabitans();
        Simulation.loadU2();
        Simulation.runSimulation2();

        Simulation.statistics();
    }
}

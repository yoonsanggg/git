package f_airplane;

import f_extends.SuperSonicAirplane;

public class SuperSonicAirplaneApp {
    public static void main(String[] args) {
        
    
    SuperSonicAirplane ssa = new SuperSonicAirplane();

    ssa.takeOff();
    ssa.fly();
    ssa.flyMode = SuperSonicAirplane.SUPERSONIC;
    ssa.fly();
    ssa.flyMode = SuperSonicAirplane.NOMAL;
    ssa.fly();
    ssa.land();
}

}

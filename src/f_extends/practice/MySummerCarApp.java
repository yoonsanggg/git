package f_extends.practice;

public class MySummerCarApp {

    public static void main(String[] args) {

        MySummerCar car = new MySummerCar();

        for(int i = 0 ; i<10;i++) {

            int res = car.run();
            

            switch (res) {
                case 1:
                   
                    car.frontLeftTire =  new KumhoTire("왼 앞", 10);
                    System.out.println("금호-타이어 교체 완료");
                    break;
                
                case 2:
                    car.frontRightTire =new KumhoTire("오른쪽 앞", 11);
                    System.out.println("금호-타이어 교체 완료");
                    break;

                case 3:
                    car.backLeftTire = new HankookTire("왼쪽 뒤", 15);
                    System.out.println("한국-타이어 교체완료");
                    break;

                case 4:
                    car.backRightTire = new HankookTire("오른쪽 뒤", 16);
                    System.out.println("한국- 타이어 교체 완료");


                case 0:
                break;
                


            }


        }
        //
        // MySummerCar car2= new MySummerCar(new KumhoTire(null, 0), new KumhoTire(null, 0), new HankookTire(null, 0), new HankookTire(null, 0));

    }

}

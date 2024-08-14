package f_extends;

public class People {

    public String name;
    public String ssn;

    // public People(){}

    //기본생성자가 없는 경우
    /**
     * 부모의 생성자를 명시적으로 호출해야함! [코드를 작성해야된다는 의미]
     * 
     * 
     * @param name
     * @param ssn
     */
    public People(String name, String ssn) {
        this.name = name;
        this.ssn = ssn;
    }


}

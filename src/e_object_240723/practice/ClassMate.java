package e_object_240723.practice;

public class ClassMate {
    // 부품들
    Student[] students = new Student[10]; 
    Teacher t;

    
    // 매개변수로 Student를 받아서 배열에 세트


    public void setStudent(Student s) {

        for(int i = 0 ; i < students.length; i++) {
            // 배열에 방이 비어있으면
            // 인덱스 i에 넣어줘
            if(students[i]==null){
            students[i] = s; 

            }else if (students[i]!=null){
                break;
                
            }


        }

    }

}

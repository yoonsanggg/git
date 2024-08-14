package com.human;

import a_varibale.Variable;
import a_varibale.VariableType;

public class A_variableApp {
    public static void main(String[] args) {
        // 메서드 생성해서 호출

        Variable v = new Variable();
        v.var3();
        v.var1();
        v.var2();
                System.out.println("========================");
        // ()매개변수가 들어 갈 수 있는 부분
        v.gugudan();
        
        VariableType h = new VariableType();{
        h.type1();
        h.type2();
        System.out.println("type3");
        h.type3();
        System.out.println("type4");
        h.type4();
    }
    }
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.institutmvm;

import java.util.Scanner;


public class Ejercicio9 {
    private static final String MSG_1 = "El numero esta dentro del intervalo";
    private static final String MSG_2 = "El numero no esta dentro del intervalo";
    private static final String MSG_3 = "Introduce un numero entre el 5 - 50";
    
    public static void main(String[] args) {
        int num1;
        Scanner sc = new Scanner(System.in);
        
        System.out.println(MSG_3);
        num1 = sc.nextInt();
        if(num1 >= 5 && num1 <= 50) {
            System.out.println(MSG_1);
        }
        else{
            System.out.println(MSG_2);
        }
    }
}

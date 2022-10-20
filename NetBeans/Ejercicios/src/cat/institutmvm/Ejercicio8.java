/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cat.institutmvm;

import java.util.Scanner;


public class Ejercicio8 {
    private static final String MSG_1 = "El nombre es natural";
    private static final String MSG_2 = "El nombre no es natural";
    private static final String MSG_3 = "Introduce un numero";
    
    public static void main(String[] args) {
        int num1;
        Scanner sc = new Scanner(System.in);

        System.out.println(MSG_3);
        num1 = sc.nextInt();
        if(num1 >= 0){
            System.out.println(MSG_1);
        }
        else{
            System.out.println(MSG_2);
        }
    }
    
}

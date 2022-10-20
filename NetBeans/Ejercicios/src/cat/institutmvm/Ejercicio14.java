/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.institutmvm;

import java.util.Scanner;

public class Ejercicio14 {
    private static final String MSG_1 = "Vulelva a escribir un numero del 0 al 10";
    private static final String MSG_2 = "Numero correcto";
    private static final String MSG_3 = "Escribe un numero del 0 al 10";
    
    public static void main(String[] args) {
        int numero;
        Scanner sc = new Scanner(System.in);
        
        System.out.println(MSG_3);
        numero = sc.nextInt();
        
        while (numero <= 0 || numero >= 10) {
            System.out.println(MSG_1);
            numero = sc.nextInt();
        }
        
        System.out.println(MSG_2);
    }
}

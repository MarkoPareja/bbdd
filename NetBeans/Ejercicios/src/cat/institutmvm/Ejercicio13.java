/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.institutmvm;

import java.util.Scanner;

public class Ejercicio13 {
    private static final String MSG_1 = "La media es: ";
    private static final String MSG_2 = "Introduce 10 numeros para calcular la media";
    
    public static void main(String[] args) {
        int i, num, resultado, avg=0;
        Scanner sc = new Scanner(System.in);
        
        System.out.println(MSG_2);
        for (i=0;i<5;i++) {
            num = sc.nextInt();
            avg = (avg + num);
        } 
        resultado = (avg / i);
        System.out.println(MSG_1 + resultado);
    }
}

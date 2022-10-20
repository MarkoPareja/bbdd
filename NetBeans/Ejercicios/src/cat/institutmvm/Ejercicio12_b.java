/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.institutmvm;

import java.util.Scanner;

public class Ejercicio12_b {
    private static final String MSG_1 = "Este es el resultado por 2: ";
    private static final String MSG_2 = "Este es el resultado por 3: ";
    private static final String MSG_3 = "Ingresa un numero para multiplicarlo por dos y por tres";
    
    public static void main(String[] args) {
        int numero, resultadox2, resultadox3;
        Scanner sc = new Scanner(System.in);

        
        System.out.println(MSG_3);
        numero = sc.nextInt();
        
        resultadox2 = (numero * 2);
        resultadox3 = (numero * 3);
        
        System.out.println(MSG_1 + resultadox2);
        System.out.println(MSG_2 + resultadox3);
    }
}

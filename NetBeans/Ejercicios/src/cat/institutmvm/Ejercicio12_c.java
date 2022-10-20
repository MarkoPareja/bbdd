/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.institutmvm;

import java.util.Scanner;

public class Ejercicio12_c {
    private static final String MSG_1 = "Los dos primeros números son más grandes que el tercero";
    private static final String MSG_2 = "El tercer numero es mas grande que los dos primero sumados";
    private static final String MSG_3 = "Escribe tres numeros";
    
    public static void main(String[] args) {
        int numero1, numero2, numero3;
        Scanner sc = new Scanner(System.in);
        
        System.out.println(MSG_3);
        numero1 = sc.nextInt();
        numero2 = sc.nextInt();
        numero3 = sc.nextInt();
        
        numero1 = (numero1 + numero2);
        
        if(numero1 > numero3){
            System.out.println(MSG_1);
        }
        else{
            System.out.println(MSG_2);
        }
    }
}

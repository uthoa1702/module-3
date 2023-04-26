import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean flag;
        int n;
        do {
            flag = true;
            System.out.println("nhap so chan n");
            n = Integer.parseInt(scanner.nextLine());
            if (n % 2 == 0) {
                flag = false;
            }
            else {
                System.out.println("sai rui` nhap lai. di");
            }
        } while (flag);

        veHinh(n);
    }

    public static void veHinh(int n) {
        int a = (n / 2) + 1;
        for (int i = a; i > 1; i--) {
            for (int x = a; x >= i; x--) {
                System.out.print("");
            }
            for (int j = i * 2 - 1; j >= 2; j--) {
                System.out.print("*");
            }
            System.out.println("");
        }
        for (int i = 2; i <= a; i++) {
            for (int x = a + 1; x > i; x--) {
                System.out.print("");
            }
            for (int j = 2; j <= i * 2 - 1; j++) {
                System.out.print("*");
            }
            System.out.println("");
        }
    }
}
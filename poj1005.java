import java.io.*;
import java.util.*;

public class Main {
    public static void main(String args[]) throws Exception {
        Scanner cin = new Scanner(System.in);
        int n;
        n = cin.nextInt();
        int i;
        for(i=0;i<n;i++){
            double x,y;
            x=cin.nextDouble();
            y=cin.nextDouble();
            double res = 0.03141592653589793 * (x*x+y*y);
            String resstr = String.valueOf(res+1);
            System.out.println("Property "+(i+1)+": This property will begin eroding in year "+resstr.split("\\.")[0]+".");
        }
        System.out.println("END OF OUTPUT.");
    }
}

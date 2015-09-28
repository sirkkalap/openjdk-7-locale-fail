import java.util.Currency;
import java.util.Locale;

/**
 * Causes java.lang.IllegalArgumentError on debian jessie OpenJDK 1.7.0_79,
 * when LANG=C.UTF-8
 * @Author sirpete@iki.fi
 * @DateCreated 2015-09-28
 */
public class Main {
    public static void main(String[] args) {
        Locale locale = Locale.getDefault();
        System.out.println("Locale: " + locale);
        System.out.println("Country: " + locale.getCountry());
        Currency currency = Currency.getInstance(locale);
        System.out.println("Currency: " + currency);
    }
}
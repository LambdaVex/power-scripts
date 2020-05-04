import java.time.Duration;
import java.time.LocalTime;

public class TimeTest {
    public static void main(String[] args) {
        System.out.println(">_ " +  LocalTime.of(7,30).plus(Duration.ofHours(8).plusMinutes(21))); // or System.out.println("at  : " +  start.plusHours(8).plusMinutes(21));
    }
}

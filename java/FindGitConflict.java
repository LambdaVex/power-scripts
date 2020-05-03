import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.IntStream;

public class FindGitConflict {

    public static void main(String... args) throws Exception {
        Files.lines(Paths.get("resources/index.html"))
             .dropWhile(l -> !l.contains("<<<<<<<"))
             .skip(1)
             .takeWhile(l -> !l.contains(">>>>>>>"))
             .forEach(System.out::println);

    }
}

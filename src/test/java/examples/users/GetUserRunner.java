package examples.users;

import com.intuit.karate.junit5.Karate;

public class GetUserRunner {
    @Karate.Test
    Karate User() {
        return Karate.run("getUser").relativeTo(getClass());
    }
}

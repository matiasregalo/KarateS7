package examples.users;

import com.intuit.karate.junit5.Karate;

public class UpdateUserRunner {
    @Karate.Test
    Karate User() {
        return Karate.run("updateUser").relativeTo(getClass());
    }
}

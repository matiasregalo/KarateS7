package examples.users;

import com.intuit.karate.junit5.Karate;

public class CreateUserRunner {
    @Karate.Test
    Karate User() {
        return Karate.run("createUser").relativeTo(getClass());
    }
}

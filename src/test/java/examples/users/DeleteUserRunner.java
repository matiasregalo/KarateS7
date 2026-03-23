package examples.users;

import com.intuit.karate.junit5.Karate;

public class DeleteUserRunner {
    @Karate.Test
    Karate User() {
        return Karate.run("deleteUser").relativeTo(getClass());
    }
}

import com.leman.entity.User;
import com.leman.service.UserService;
import com.leman.service.impl.UserServiceImpl;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/12/12
 * Time: 15:40
 * To change this template use File | Settings | File Templates.
 * Description:
 */

public class Test {
    public static void main(String[] args) {
        UserService userService = new UserServiceImpl();
        User handle_user = new User();
        handle_user.setId(1);
        handle_user.setUsername("小小小小");
        handle_user.setGender("男");
        userService.updateUser(handle_user);
    }
}